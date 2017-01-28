module SessionsHelper

#This module (helper) included in app controller

  #logs in the given staff
  def log_in(staff)
    #staff.id will be used in url And,
    #in real world we don't want it.
    #people will know how many staffs we have!
    session[:staff_id] = staff.id
  end

  #Remembers a staff in a persistent session.
  def remember(staff)
    staff.remember
    cookies.permanent.signed[:staff_id] = staff.id
    cookies.permanent[:remember_token] = staff.remember_token
  end

  #Returns the current logged-in staff (if Any).
  def current_staff
    if (staff_id = session[:staff_id])
      #Prevent database call spam by using an
      #instance variable *(memoization)*
      @current_staff ||= Staff.find_by(id: staff_id)
    elsif (staff_id = cookies.signed[:staff_id])
      staff = Staff.find_by(id: staff_id)
      if staff && staff.authenticated?(cookies[:remember_token])
        log_in staff
        @current_staff = staff
      end
    end
  end

  def logged_in?
    !current_staff.nil?
  end

  def forget(staff)
    staff.forget
    cookies.delete(:staff_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_staff)
    session.delete(:staff_id) # session[:staff_id] = nil
    @current_staff = nil
  end


end
