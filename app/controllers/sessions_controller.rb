class SessionsController < ApplicationController
layout "staff/login"
  def index

  end

  def new

  end

  def create
    staff = Staff.find_by(email: params[:session][:email])
    if staff && staff.authenticate(params[:session][:password])
      #log_in(staff)  check session helper
      log_in staff
      #using Helper
      params[:session][:remember_me] == '1' ? remember(staff) : forget(staff)
      redirect_to staff
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
