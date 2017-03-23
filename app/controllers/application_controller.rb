class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include StatusHelper

private
  def confirm_logged_in
  unless session[:staff_id] || session[:student_id] || cookies.signed[:staff_id] || cookies.signed[:student_id]

      redirect_to login_path,danger:"لطفاً وارد سایت شوید"
      return false
    else
      return true
    end
  end
end
