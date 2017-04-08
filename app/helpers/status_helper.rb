module StatusHelper

  def get_module_routes(module_id)  # input module_id and Return array for  module id
      h = { 1=>[2],2=>[2] }
      return h[module_id]
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
