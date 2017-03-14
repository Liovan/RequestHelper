class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  MODULE_ROUTES=[1=>[2,3,5]]

  MESSAGE_STATUS=[1=>["تایید"]]

  def GetModuleRoutes
    MODULE_ROUTES
  end
  def MessageStatus
    MESSAGE_STATUS
  end
end
