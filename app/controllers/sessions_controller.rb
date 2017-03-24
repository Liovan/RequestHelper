class SessionsController < ApplicationController
 before_action :staff_logged_in

 before_action :logged,except: :index


 # before_action :student_logged_in,only: :index

  layout "login/index"
  def index
    render layout: "staff/admin"
  end
  def new

  end

  def create
    #Type of user
    if params[:session][:type] == nil
      user = Student.find_by(student_code: params[:session][:student_code])
    else
      user = Staff.find_by(username: params[:session][:username])
    end

    if user && user.authenticate(params[:session][:password])
      #log_in(staff)  check session helper
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if user.class==Student
        redirect_to students_path
      else
        redirect_to sessions_path
      end
    else
      #flash.now works with rendering (when no redirect)
      #NOTE for security reason we show same message to both invalid requests
      flash[:danger]  = "ترکیب نام کاربری/رمز عبور نامعتبر است"
      redirect_to new_session_path
    end
  end

  def destroy
    log_out if logged_in?  #Prevent error. if staff logged out already
    redirect_to root_url
  end
  private
  def logged

      if current_user.class==Student
        redirect_to students_path
      else
        redirect_to sessions_path
        return true
      end
    return true
    end




end
