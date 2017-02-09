class PlacesController < ApplicationController
  layout "staff/admin"
  def index
    @places=Place.all
  end

  def new
    @place=Place.new
  end
  def create
    @place=Place.new(place_params)
      respond_to do |format|
        if @place.valid? && @place.save
         format.html{redirect_to places_path,success:"با موفقیت اضافه شد #{@place.name} سمت "}
         format.js
        else
          format.html{redirect_to places_path,warning:"عملیات با شکست مواجه شد"}
          format.js
        end
      end
  end
  def edit
    if params[:id].present?
    @place=Place.find(params[:id])
    end
  end
  def update
    respond_to do |format|
      @place=Place.find(params[:id])
        if @place.update_attributes(place_params)
          format.html{redirect_to places_path,success:"عملیات با موفقیت انجام شد"}
          format.js
        else
          format.html{redirect_to places_path,warning:"عملیات با شکست مواجه شد"}
          format.js
        end
      end
  end

  def destroy
    if params[:id].present?
        respond_to do |format|
          @place=Place.find(params[:id])
          if @place.destroy
          format.html{redirect_to places_path,success:"عملیات با موفقیت انجام شد"}
          format.js
          else
          format.html{redirect_to places_path,warning:"عملیات با شکست مواجه شد"}
          format.js
        end
      end
    end
  end
  private
  def place_params
    params.require(:place).permit(:name)
  end
end
