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

      file_location =request.base_url+attach.files.url # path file csv uploaded 
      is_error=false
      # open file csv
      open(file_location, 'r:utf-8') do |f|  
        data = SmarterCSV.process(f,{:convert_values_to_numeric=>false}) #process csv file
          data.each do |student|
            # for error when insert student to db 
            if is_error
              flash[:danger]="متاسفانه در هنگام بهنگام سازی دچار خطا شده است ، لطفاْ با راهبر تماس بگیرید"
              redirect_to import_students_path
              return 0
            end
            # convert grade and major student
            if student[:major].strip=='نرم افزار' && student[:grade].strip=='کاردانی'
                field_of_student=1
                elsif  student[:major].strip=='حسابداری' && student[:grade].strip=='کاردانی'
                field_of_student=2
                elsif student[:major].strip=='ICT' && student[:grade].strip=='کاردانی'
                field_of_student=3
                elsif student[:major].strip=='الکترونیک' && student[:grade].strip=='کاردانی'
                field_of_student=4
                elsif student[:major].strip=='IT' && student[:grade].strip=='کاردانی'
                field_of_student=5
                
                elsif student[:major].strip=='نرم افزار' && student[:grade].strip=='کارشناسی'
                field_of_student=11
                elsif student[:major].strip=='حسابداری' && student[:grade].strip=='کارشناسی'
                field_of_student=12
                elsif student[:major].strip=='ICT' && student[:grade].strip=='کارشناسی'
                field_of_student=13
                elsif student[:major].strip=='الکترونیک' && student[:grade].strip=='کارشناسی'
                field_of_student=14
                elsif student[:major].strip=='IT' && student[:grade].strip=='کارشناسی'
                field_of_student=15
            end
             # insert students from csv file To DataBase
            Temp.transaction do
               if  Temp.create(f_name:student[:f_name],l_name:student[:l_name],
                            father_name:student[:father_name],meli_code:student[:meli_code],
                            city:student[:city],field:field_of_student,student_code:student[:student_code],password_digest:student[:meli_code])
                 is_error=false
               else
                 is_error=true
                 raise ActiveRecord::Rollback
               end
            end
          end
          if is_error==false
            Temp.sync_students # sync student in temp and students table
            flash[:success]="#{Time.now.strftime("%H:%M:%S")} عملیات همگام سازی با موفقیت انجام شد"
            redirect_to import_students_path
          else
            flash[:danger]="متاسغانه عملیات همگام سازی ناموفق بودs"
            redirect_to import_students_path
          end
        
      end
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
