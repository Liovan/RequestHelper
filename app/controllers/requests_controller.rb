class RequestsController < ApplicationController
  include BatchRequestHelper
  before_action :staff_logged_in ,except: :create
  before_action :student_logged_in ,only: :create
  layout "staff/admin"

  def index
# clear_batch
    place=current_user.place_id if present?
    @requests=Request.active_place_related(place)
    @batch=get_batch

  end
  def show
     @request=Request.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
  def new
  # @request=Request.new(request_params)
  end

  def create
    student=current_user
    feature=Feature.find(params[:feature_id])
    first_confirm=get_module_routes(feature.id).first # get first value in module routes helper-]
    status=1

        if !feature.nil?
          valid=false
          feature.needs.map do |need|

            if !params[:"form_#{need.id}"].present? && need.input_type==3 || params[:"form_#{need.id}"].present? && need.input_type!=3
                # validation for dynamic result student
                # requirement_types => 1: number , 2: character , 3: check box (true ot false)
              unless params[:"form_#{need.id}"].present?
                params[:"form_#{need.id}"]=false
              end

                  case need.input_type
                    when requirement_types.key("عدد")
                      params[:"form_#{need.id}"].match(/\A[+-]?\d+?(\.\d+)?\Z/)!=nil ? valid=true : valid=false
                    when requirement_types.key("کارکتر")
                      params[:"form_#{need.id}"].match(/\A[اآبپتثئجچحخدذرزژسشصضطظعغفقکگلمنوهیءأؤّ\s]+\z/)!=nil ? valid=true : valid=false
                    when requirement_types.key("گزینه")
                      params[:"form_#{need.id}"]==true || params[:"form_#{need.id}"]==false ? valid=true : valid=false
                  end

                   # if it was valid go for save data
                if valid==true
                  Request.transaction do
                      if request=Request.create(student_id:student.id,feature_id:feature.id,status:status,module_pointer: first_confirm)
                          if ResultStudent.create(request_id:request.id,need_id:need.id,value:params[:"form_#{need.id}"])
                              redirect_to students_path,success:"در خواست شما با موفقیت ارسال شد"
                            else
                              redirect_to students_path,danger:"متاسفانه درخواست شما با موفقیت انجام نشد"
                              raise ActiveRecord::Rollback
                          end
                      end
                  end
                else
                  # when not valid
                  redirect_to students_path,danger:"اشتباه می باشد لطفاً مقادیر را صحیح وارد کنید #{feature.name} مقادیری پر شده برای درخواست"
                end
            else
                  # when not correct params for field needs of feature
              redirect_to students_path,danger:"ارسال درخواست لغو شد"
              break # break in loop needs of feature
            end


          end
        else
           # if not fimd feature in params[:featue_id]
          redirect_to students_path,danger:"ارسال درخواست لغو شد"
    end
  end


  def edit
  end

  def update

    
    # unless user_type==Staff && req.module_pointer == @current_user.place_id && req.status ==  1  #if you aren't staff user OR insufficient place OR request's status isnt 'in progress'
    #    redirect_to request.referer || requests_path,danger: "شما اجازه تغییر این درخواست را ندارید."
    #   return
    # end
    req = Request.find(params[:id]) unless params[:id].to_i==-1 # return request if params[:id] != -1
    case params[:type]
      when "Confirm"
        unless params[:id]=='-1'     #note param[:id] != -1 => Confirm for one requests ( staffs != staff.last)
          mod = get_module_routes(req.feature_id)
          if mod.size > mod.index(req.module_pointer)+1
            # confrim request and next staff
            Request.transaction do
              req.module_pointer = mod[mod.index(req.module_pointer)+1] #Approve
              req.save
              respond_to do |format|
                if Refer.create(staff_id: current_user.id, request_id: req.id) #Logging #TODO add message_id
                  format.js{flash.now[:success]="عملیات با موفقیت انجام شد"}
                else
                  format.js{flash.now[:danger]="متاسفانه عملیات با موفقیت انجام نشد"}
                end
              end
            end
          else
            #confirm request and create refer (ready for print request)
            Request.transaction do
              req.status = 2 #Certificate
              req.save
              respond_to do |format|
                if Refer.create(staff_id:current_user.id, request_id: req.id)#TODO add message_id
                  format.js{flash.now[:success]="عملیات با موفقیت انجام شد"}
                else
                  format.js{flash.now[:danger]="متاسفانه عملیات با موفقیت انجام نشد"}
                end
              end
            end
          end
          
        else  #note param[:id] : -1=> Confirm for all requests

          get_requests_batch.each do |rq|
            mod = get_module_routes(rq.feature_id)
            if mod.size > mod.index(rq.module_pointer)+1
              Request.transaction do
                rq.module_pointer = mod[mod.index(rq.module_pointer)+1] #Approve
                rq.save
                
                respond_to do |format|
                  if Refer.create(staff_id: current_user.id, request_id: rq.id) #Logging #TODO add message_id
                    format.js{flash.now[:success]="عملیات با موفقیت انجام شد"}
                    @status_respond=true
                    @batch=get_batch

                  else
                    format.js{flash.now[:danger]="متاسفانه عملیات با موفقیت انجام نشد"}
                  end
                end
              end
            else
              Request.transaction do
                rq.status = 2 #Certificate
                rq.save
               
                respond_to do |format|
                  if Refer.create(staff_id:current_user.id, request_id: rq.id)#TODO add message_id
                    format.js{flash.now[:success]="عملیات با موفقیت انجام شد"}
                    @status_respond=true
                    @batch=get_batch
                   
                  else
                    format.js{flash.now[:danger]="متاسفانه عملیات با موفقیت انجام نشد"}
                  end
                end
              end
            end
          end
           # clear_batch #note clear all element in batch list
        end
        
    when "Reject"
      Request.transaction do
        req.status = 3 #Rejected
        req.save
        @refer=Refer.create(staff_id: current_user.id, request_id: req.id,message_id:params[:message])
        respond_to do |format|
       if @refer
         format.js{flash.now[:success]="درخواست انتخابی شما با موفقیت رد شد"}
         else 
         format.js{flash.now[:danger]="درخواست انتخابی شما با موفقیت رد شد"}
         end

        end
      end

    end
    @batch=get_batch

  end

  def destroy
  end


  def batch_pdf


    # respond_to do |format|   buggy
    #   format.html
    #   format.pdf do
    #     render :pdf => "invoice"
    #     # render pdf:"asa",template:"forms/index.html.erb", :formats => [:html], :locals => { :forms=>requests }
    #     # render pdf: "file_name"   # Excluding ".pdf" extension.
    #   end
    # end

  end

  def batch_print
    
  render "forms/index",layout: "form/index",locals: {forms:get_requests_batch}

  end

  def batch # create request to batch
    if params[:id].present?
      respond_to do |format|
          unless has_batch?(params[:id])
             add_batch(params[:id])
             @batch=get_batch
             format.js{flash.now[:success]="درخواست با موفقیت در لیست چاپی قرار گرفت"}
          else
            @batch=get_batch
            format.js{flash.now[:warning]="این درخواست قبلاً در لیست  قرار داده شده"}
          end
        end
    end
  end

  def delete_batch
    clear_batch # clear session batch print
      respond_to do |format|
        format.js{flash.now[:success]="لیست چاپی با موفقیت پاک شد"}
      end
  end

  def prints
    @requests=Request.request_print(current_user.place_id)
    @batch=get_batch

    
  end
 
  private
  def request_params
    params.require(:request).permit(:feature_id)
  end
  

  def get_requests_batch # return requests as type active record into batch
    Request.find_by_array(get_batch).to_a
  end




end
