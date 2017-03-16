class SessionsController < ApplicationController
layout "login/index"
  def index
    render layout: "staff/admin"
  end
  def new

  end

  def create
    #Type of user
    if params[:type] != nil
      user = Student.find_by(student_code: params[:student_code])
    else
      user = Staff.find_by(username: params[:username])
    end

    if user && user.authenticate(params[:password])
      #log_in(staff)  check session helper
      log_in (user)
      #using Helper
      params[:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to students_path
      #NOTE Must be checked
    else
      if user.class==Staff
      #flash.now works with rendering (when no redirect)
      flash[:danger]  = "ترکیب نام کاربری/رمز عبور نامعتبر است"
      else
      flash[:danger]  = "شماره دانشجویی یا رمز عبور نامعتبر است"
      end
      render 'new'
      # redirect_to new_session_path
    end
  end

  def destroy
    log_out if logged_in?  #Prevent error. if staff logged out already
    redirect_to root_url
  end

end
