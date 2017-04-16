class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include StatusHelper

private
  def student_logged_in
    I18n.locale = :fa
      unless session[:student_id] || cookies.signed[:student_id] && user_type==Student
        redirect_to login_path,danger:"لطفاً وارد سایت شوید"
        return false
      else
        return true
      end
  end

  def staff_logged_in
    I18n.locale = :fa
      unless session[:staff_id] || cookies.signed[:staff_id] && user_type==Staff
        redirect_to login_path,danger:"لطفاً وارد سایت شوید"
        return false
      else
        return true
      end
    end

end
