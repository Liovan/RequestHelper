class FeaturesController < ApplicationController
  before_action :staff_logged_in
  layout "staff/admin"
  def index
    @features=Feature.all
  end

  def new
    @feature=Feature.new
  end
  def create
    @feature=Feature.new(feature_params)
   respond_to do |format|
     if @feature.save
       format.html{redirect_to features_path,success:"عملیات با موفقیت انجام شد"}
       format.js{flash.now[:success]="عملیات با موفقیت انجام شد"}
     else
        format.html{redirect_to features_path,danger:"عملیات با موفقیت انجام نشد"}
        format.js{flash.now[:danger]="عملیات با موفقیت انجام نشد"}
     end
   end
  end

  def update
    if params[:id].present?
      @feature=Feature.find(params[:id])
      respond_to do |format|
        if @feature.update_attributes(feature_params)
          format.html{redirect_to feature_path,success:"عملیات با موفقیت انجام شد"}
          format.js{flash.now[:success]="عملیات با موفقیت انجام شد"}
        else
          format.html{redirect_to feature_path,danger:"عملیات با موفقیت انجام نشد"}
          format.js{flash.now[:danger]="عملیات با موفقیت انجام نشد"}
        end
      end
    end
  end

  def edit
    if params[:id].present?
      @feature=Feature.find(params[:id])
    end
  end

  def destroy
    if params[:id].present?
      @feature=Feature.find(params[:id])
      respond_to do |format|
        if @feature.destroy
        format.html{redirect_to features_path,success:"عملیات با موفقیت انجام شد"}
        format.js{flash.now[:success]="عملیات با موفقیت انجام شد"}
        else
          format.html{redirect_to features_path,danger:"عملیات با شکست مواجه شد"}
          format.js{flash.now[:danger]="عملیات با شکست مواجه شد"}
        end
      end
    end

  end
  private
  def feature_params
    params.require(:feature).permit(:name)
  end

end
