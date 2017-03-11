class RequestsController < ApplicationController
  layout "staff/admin"
  def index
    @requests=Request.all
  end

  def new
  @request=Request.new(requea)
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
    params.require(:request).permit(:student_id,:feature_id,:is_cancel)
  end
end
