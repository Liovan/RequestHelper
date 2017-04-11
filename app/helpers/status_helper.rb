module StatusHelper

  def get_module_routes(module_id=nil)  # input module_id and Return array for  module id
      h = { 1=>[7,1] } 
      return h[module_id] unless module_id==nil # if module_id != nil search by key
      return h # if module_id == nil return hash
  end
  def get_message_status # status message for request
    {
        1=>'در حال بررسی',
        2=>'تایید شده',
        3=>'رد شده',
        4=>'لغو شده'
    }
  end
  def field_of_study # Field of Study for student
    {
        1=>{ :major => 'نرم افزار/کامپیوتر', :grade => 'کاردانی'},
        2=>{ :major => 'حسابداری', :grade => 'کاردانی'},
        3=>{ :major => 'ICT', :grade => 'کاردانی'},
        4=>{ :major => 'الکترونیک', :grade => 'کاردانی'},
        5=>{ :major => 'IT', :grade => 'کاردانی'},

        11=>{ :major => 'نرم افزار/کامپیوتر', :grade => 'کارشناسی'},
        12=>{ :major => 'حسابداری', :grade => 'کارشناسی'},
        13=>{ :major => 'ICT', :grade => 'کارشناسی'},
        14=>{ :major => 'الکترونیک', :grade => 'کارشناسی'},
        15=>{ :major => 'IT', :grade => 'کارشناسی'}
    }
  end
  def requirement_types # for  type input field for needs
    {
        1=>'عدد',
        2=>'کارکتر',
        3=>'گزینه'
    }
  end
end
