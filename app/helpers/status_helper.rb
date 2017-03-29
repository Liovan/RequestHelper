module StatusHelper

  def get_module_routes(module_id)  # [ 1(id module) => [id palces ] ]
      h = { 1=>[1,3,5] }
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
  def get_field_student # Field of Study for student
    {
        1=>'نرم افزار کامپیوتر' ,
        2=>'حسابداری',
        3=>'ICT',
        4=>'الکترونیک',
        5=> 'IT'
    }
  end
  def types_need # for  type input field for needs
    {
        1=>"عدد",
        2=>"کارکتر",
        3=>"گزینه"
    }
  end
end
