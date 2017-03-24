class StudentsController < ApplicationController
  # before_action :confirm_logged_in
  before_action :student_logged_in
  layout "student/admin"
  def index
    @request=Request.new
  end

  def create # send request

  end

  def edit
  end

  def update
  end

  def destroy
  end
  def requests

  end
  private
  def request_params
    params.require(:request).permit(:student_id,:feature_id,:status,:module_pointer,:type_request)
  end
end
