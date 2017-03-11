class SessionsController < ApplicationController
layout "staff/login"

  def new
  end

  def create
    if params[:session][:type] != nil
      user = Staff.find_by(username: params[:session][:username])
    else
      user = Student.find_by(meli_code: params[:session][:meli_code])
    end


    if user && user.authenticate(params[:session][:password])
      #log_in(staff)  check session helper
      log_in (user)
      #using Helper
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user #NOTE Must be checked
    else
      #flash.now works with rendering (when no redirect)
      flash.now[:danger]  = "ترکیب نام کاربری/رمز عبور نامعتبر است."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?  #Prevent error. if staff logged out already
    redirect_to root_url
  end

end
