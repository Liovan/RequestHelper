class FeaturesController < ApplicationController
  before_action :confirm_logged_in
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
       format.js
     else
       redirect_to features_path
        format.html{redirect_to features_path,warning:"عملیات با موفقیت انجام نشد"}
        format.js
     end
   end
  end

  def update
    if params[:id].present?
      @feature=Feature.find(params[:id])
      respond_to do |format|
        if @feature.update_attributes(feature_params)
          format.html{redirect_to feature_path,success:"عملیات با موفقیت انجام شد"}
          format.js
        else
          format.html{redirect_to feature_path,success:"عملیات با موفقیت انجام نشد"}
          format.js
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
        format.js
        else
          format.html{redirect_to features_path,warning:"عملیات با شکست مواجه شد"}
          format.js
        end
      end
    end

  end
  private
  def feature_params
    params.require(:feature).permit(:name)
  end

end
