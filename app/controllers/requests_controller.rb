class RequestsController < ApplicationController
  before_action :staff_logged_in ,except: :create
  before_action :student_logged_in ,only: :create
  layout "staff/admin"

  def index
    place=current_user.place
    @requests=Request.place_related(place.id)
  end

  def new
  # @request=Request.new(request_params)
  end

  def create
    student=current_user
    feature=Feature.find(params[:feature_id])
    first_confirm=get_module_routes[feature.id].first # get first value in module routes helper
    status=1
        if !feature.nil?
          valid=false
          feature.needs.map do |need|
            if params[:"form_#{need.id}"].present?
                # validation for dynamic result student
                # types_need => 1: number , 2: character , 3: check box (true ot false)
                  case need.input_type
                    when types_need.key("عدد")
                      params[:"form_#{need.id}"].match(/\A[+-]?\d+?(\.\d+)?\Z/)!=nil ? valid=true : valid=false
                    when types_need.key("کارکتر")
                      params[:"form_#{need.id}"].match(/\A[اآبپتثئجچحخدذرزژسشصضطظعغفقکگلمنوهیءأؤّ\s]+\z/)!=nil ? valid=true : valid=false
                    when types_need.key("گزینه")
                      params[:"form_#{need.id}"]==true || params[:"form_#{need.id}"]==false ? valid=true : valid=false
                  end
                   # if it was valid go for save data
                if valid==true
                  Request.transaction do
                      if request=Request.create(student_id:student.id,feature_id:feature.id,status:status,module_pointer:first_confirm)
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

    case params[:type]
    when "Confirm"
      #تایید
    when "Reject"
      #رد کردن
    when "Certficate"
      #صدور گواهی
    else
      #ورودی_اشتباه
    end

  end

  def destroy
  end

  private
  def request_params
    params.require(:request).permit(:feature_id)
  end

end
