class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include StatusHelper

private
  def student_logged_in

      unless session[:student_id] || cookies.signed[:student_id] && current_user.class!=Student
        redirect_to login_path,danger:"لطفاً وارد سایت شوید"
        return false
      else
        return true
      end

  end

  def staff_logged_in

      unless session[:staff_id] || cookies.signed[:staff_id] && current_user.class!=Staff
        redirect_to login_path,danger:"لطفاً وارد سایت شوید"
        return false
      else
        return true
      end
    end

end
