class MessagesController < ApplicationController
  layout "staff/admin"
  def index
    @messages=Message.all
    @request=Request.find(params[:request_id])
    respond_to do |format|
      format.js
    end
  end
  
  def new
     @message=Message.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @message=Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.js
      else
        format.js{flash.now[:danger]="متاسفانه عملیات با موفقیت انجام نشد"}
      end
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:text)
  end
end
