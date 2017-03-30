class RequestStudentsController < ApplicationController
  before_action :student_logged_in
  layout "student/admin"
  def index
  end

  def show
  end
end
