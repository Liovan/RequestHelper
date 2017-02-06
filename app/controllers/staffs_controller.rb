class StaffsController < ApplicationController
  layout "staff/admin"
  def index
    @staffs=Staff.sorted
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
