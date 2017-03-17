class RequestsController < ApplicationController
  layout "staff/admin"
  def index
    @requests=Request.all
  end

  def new
  @request=Request.new(request_params)
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def request_params
    params.require(:request).permit(:student_id,:feature_id,:status,:module_pointer)
  end

end
