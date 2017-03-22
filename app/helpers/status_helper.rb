module StatusHelper

  def get_module_routes  # [ 1(id module) => [id palces ] ]
    {
        1=>[2,3,5]
    }
  end
  def get_message_status # status message for request
    {
        1=>'در حال بررسی',
        2=>'تایید شد',
        3=>'رد شد',
        4=>'لغو شد'
    }
  end
  def get_field_student # Field of Study for student
    {
        1=>'نرم افزار کامپیوتر' ,
        2=>'حسابداری',
        3=>'ICT',
        4=>'الکترونیک'
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
