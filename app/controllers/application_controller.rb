class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def get_module_routes
    {1=>[2,3,5]}  # [ 1(id module) => [id palces ] ]
  end
  def get_message_status
    {
     1=>'در حال بررسی',
     2=>'تایید شد',
     3=>'رد شد',
     4=>'لغو شد'
    }
  end
end
