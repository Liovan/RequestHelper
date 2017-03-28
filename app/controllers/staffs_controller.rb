class StaffsController < ApplicationController
  before_action :staff_logged_in
  layout "staff/admin"
  def index
    @staffs=Staff.sorted
  end

  def new
    @staff=Staff.new
  end

  def create
    @staff=Staff.new(staff_params)
      respond_to do |format|
        if @staff.save
          format.html{redirect_to staffs_path,success:"عملیات با موفقیت انجام شد"}
          format.js{flash.now[:success]="عملیات با موفقیت انجام شد"}
        else
          format.html{redirect_to staffs_path,warning:"متاسفانه عملیات با شکست مواجه شده است"}
          format.js{flash.now[:warning]="متاسفانه عملیات با شکست مواجه شده است"}
        end
      end
  end

  def edit
    if params[:id].present?
      @staff=Staff.find(params[:id])
    end
  end

  def update
    if params[:id].present?
      @staff=Staff.find(params[:id])
      respond_to do |format|
        if @staff.update_attributes(staff_params)
          format.html{redirect_to staffs_path,success:"ویرایش با موفقیت انجام شد"}
          format.js{flash.now[:success]="ویرایش با موفقیت انجام شد"}
        else
          format.html{redirect_to staffs_path,warning:"متاسفانه عملیات ویرایش با موفقیت انجام نشد ، لطفاً با راهبر تماس گیرید"}
          format.js{flash.now[:danger]="متاسفانه عملیات ویرایش با موفقیت انجام نشد ، لطفاً با راهبر تماس گیرید"}
        end
      end
    end
  end

  def destroy
    if params[:id].present?
      @staff=Staff.find(params[:id])
      respond_to do |format|
        if @staff.destroy
          format.html{redirect_to staffs_path,success:"حذف با موفقیت انجام شد"}
          format.js{flash[:success]="حذف با موفقیت انجام شد"}
        else
          format.html{redirect_to staffs_path,warning:"متاسفانه عملیات حذف با موفقیت انجام نشد"}
          format.js{flash[:warning]="متاسفانه عملیات حذف با موفقیت انجام نشد"}
        end
      end
    end
  end
  private
  def staff_params
    params.require(:staff).permit(:f_name,:l_name,:place_id,:username,:password)
  end
end
