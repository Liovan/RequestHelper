class FormsController < ApplicationController
  def index
    if params[:request_id].present?
      @request=Request.find(params[:request_id])
    end
  end

  def show
  end
end
