class StaffsController < ApplicationController
  layout "staff/admin"
  def index
    @staffs=Staff.sorted
    @staff=Staff.new
  end

  # def new
  #
  # end

  def create
    @staff=Staff.new(staff_params)
    if @staff.valid? && @staff.save
      flash[:success]="با موفقیت درج شد #{@staff.l_name}کارمند با نام"
    else
      flash[:warning]="متاسفانه عملیات با شکست مواجه شده است"
    end
    redirect_to :staffs_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def staff_params
    params.require(:staff).permit(:f_name,:l_name,:place_id,:username,:password)
  end
end
