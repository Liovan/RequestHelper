module SessionsHelper
#This module (helper) included in app controller

  #logs in the given staff
  def log_in(user)
    #staff.id will be used in url And,
    #in real world we don't want it.
    #people will know how many staffs we have!
    if user.class==Staff
      session[:staff_id] = user.id
    elsif user.class==Student
      session[:student_id] = user.id
    end
  end

  #Remembers a staff in a persistent session.
  def remember(user)
    user.remember
    if user.class==Staff
      cookies.permanent.signed[:staff_id] = user.id
    elsif user.class==Student
      cookies.permanent.signed[:student_id] = user.id
    end
    cookies.permanent[:remember_token] = user.remember_token
  end

  #Returns the current logged-in staff (if Any).
  def current_user
    if (student_id = session[:student_id])           #student via session
      #Prevent database call spam by using an
      #instance variable *(memoization)*
      @current_user ||= Student.where("id = ?", student_id).first

    elsif (staff_id = session[:staff_id])            #staff via session
      @current_user ||= Staff.where("id = ?", staff_id).first

    elsif (student_id = cookies.signed[:student_id]) #student via remember_token
      student = Student.where("id = ?", student_id).first
      if student && student.authenticated?(cookies[:remember_token])
        log_in student
        @current_user = student
      end

    elsif (staff_id = cookies.signed[:staff_id])    #staff via remember_token
      staff = Staff.where("id = ?", staff_id).first
      if staff && staff.authenticated?(cookies[:remember_token])
        log_in staff
        @current_user = staff
      end

    end
  end


  def user_type #Return class current user
    current_user.class
  end



  def logged_in?
    !current_user.nil?
  end

  def forget(user)
    user.forget
    cookies.delete(:student_id) #for student
    cookies.delete(:staff_id)   #for staff
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:staff_id) # session[:staff_id] = nil
    session.delete(:student_id) # session[:student_id] = nil
    @current_user = nil
  end


end
