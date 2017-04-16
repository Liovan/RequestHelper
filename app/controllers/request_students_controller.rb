class RequestStudentsController < ApplicationController
  before_action :student_logged_in

  layout "student/admin"
  def index
    @requests=Request.requests_student(current_user.id).paginate(:page => params[:page],per_page:10)
  end

  def show
    if params[:id].present?
      @request=Request.find(params[:id])
    end
  end
end
