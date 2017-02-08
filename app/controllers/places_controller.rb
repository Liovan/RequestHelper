class PlacesController < ApplicationController
  layout "staff/admin"
  def index
    @places=Place.all
    @place=Place.new
  end

  def create
    @place=Place.new(place_params)
    if @place.valid? && @place.save
      flash[:success]="با موفقیت اضافه شد #{@place.name} سمت "
    else
      flash[:warning]="عملیات با شکست مواجه شد"
    end
    redirect_to places_path
  end

  def update
  end

  def destroy
  end
  private
  def place_params
    params.require(:place).permit(:name)
  end
end
