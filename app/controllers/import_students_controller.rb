class ImportStudentsController < ApplicationController
  before_action :staff_logged_in
  layout "staff/admin"

  def index
  @attachments=Attachment.all
    
  end

  def new

  end
  
  
  def update
    if params[:id].present?
      attach=Attachment.find params[:id]

      file_location =   request.base_url+attach.files.url
      open(file_location, 'r:utf-8') do |f|   # don't forget to specify the UTF-8 encoding!!
        data = SmarterCSV.process(f)
        sdfsdfds
      end
      
      tt4444
    end
  end

  def create
    if params[:import_students][:files].present?
      attach= Attachment.new attachment_params
      if attach.save
      redirect_to import_students_path
       flash[:success]="فایل با موفقیت درج شد"
     else
       flash[:danger]="متاسفانه عملیات درج با موفقیت انجام نشد"
       redirect_to import_students_path
     end
    end
  end

  def destroy
    if params[:id].present?
      @attachment=Attachment.find(params[:id])
       if @attachment.destroy
         redirect_to import_students_path
         flash[:success]="فایل مورد نظر با موفقیت پاک شد"
       else
         flash[:danger]="متاسفانه عملیات با موفقیت انجام نشد"
         redirect_to import_students_path
       end
    end
  end
  private 
  def attachment_params
    params.require(:import_students).permit(:files)
  end
end
