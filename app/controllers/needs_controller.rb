class NeedsController < ApplicationController
  layout "staff/admin"
  def index
    if params[:feature_id].present?
      @needs=Feature.find(params[:feature_id]).needs if present?
      @feature=Feature.find(params[:feature_id])

    end

  end

  def new
      if params[:feature_id].present?
        @feature=Feature.find(params[:feature_id])
        @need=Need.new
        respond_to do |format|
          format.html
          format.js
        end
      end
  end

  def create
    if params[:feature_id].present?
      @need=Need.new(need_params)
      respond_to do |format|
        if @need.save
          format.html{redirect_to feature_needs_path(params[:feature_id]),success: "عملیات با موفقیت انجام شد"}
          format.js
        else
          format.html{redirect_to feature_needs_path(params[:feature_id]),danger: "متاسفانه عملیات با موفقیت انجام نشد"}
          format.js
        end
      end
    end
  end

  def edit
    if params[:feature_id].present?
      @feature=Feature.find(params[:feature_id])
      @need=Need.find(params[:id])
    end
  end

  def update
    if params[:feature_id].present?
      @need=Need.find(params[:id])
      respond_to do |format|
        if @need.update_attributes(need_params)
            format.html{redirect_to feature_needs_path(params[:feature_id]),success:"عملیات با موفقیت انجام شد"}
            format.js
        else
          format.html{redirect_to feature_needs_path(params[:feature_id]),success:"متاسفانه عملیات با موفقیت انجام نشد"}
          format.js
        end
      end
    end
  end

  def destroy
    if params[:id].present?
      @need=Need.find(params[:id])
      respond_to do |format|
        if @need.destroy
          format.html{redirect_to feature_needs_path(params[:feature_id]),success:"عملیات با موفقیت انجام شد"}
          format.js
        else
          format.html{redirect_to feature_needs_path(params[:feature_id]),success:"متاسفانه عملیات با موفقیت انجام نشد"}
          format.js
        end
      end
    end
  end
  private
  def need_params
    params.require(:need).permit(:name,:feature_id,:input_type)
  end

end
