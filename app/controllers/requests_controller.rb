class RequestsController < ApplicationController
  layout "staff/admin"
   before_action :for_student,only: :create
  def index
    @requests=Request.all
  end

  def new
  @request=Request.new(request_params)
  end

  def create
    student=session[:student_id]
    feature=Feature.find(params[:feature_id])
    first_confirm=get_module_routes[feature.id].first # get first value in main array
    status=get_message_status[1]
    if !feature.nil?
      request=Request.new(student_id:student,feature_id:feature,status:status,module_pointer:first_confirm)
        respond_to do |format|
            if request.save
            format.html{redirect_to students_path,success:"درخواست شما با موفقیت ارسال شد"}
            format.js
            else
            format.html{redirect_to students_path,danger:"متاًسفانه درخواست شما فرستاده نشد"}
            format.js
            end
         end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def request_params
    params.require(:request).permit(:feature_id)
  end
  def for_student
    unless session[:student_id].present?
      respond_to do |format|
        format.html{redirect_to login_path,danger:"لطفاً برای دسترسی به این بخش ابتدا به سیستم وارد شوید"}
      end
      return false
    end
    return true
  end




end