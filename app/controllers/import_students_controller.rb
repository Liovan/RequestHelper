class ImportStudentsController < ApplicationController
  before_action :staff_logged_in
  layout "staff/admin"
  def index
  @attachment=Attachment.all
    
  end

  def new

  end

  def create
    if params[:import_students][:files].present?
     if  Attachment.create attachment_params
      render "import_students/index"
     end
    end

  end

  def destroy
    if params[:id].present?
      
    end
  end
  private 
  def attachment_params
    params.require(:import_students).permit(:files)
  end
end
