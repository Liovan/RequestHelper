class RequestStudentsController < ApplicationController
  before_action :student_logged_in

  layout "student/admin"
  def index
    @requests=Request.requests_student(current_user.id).limit(5)
  end

  def show
  end
end
