require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  def setup
    @staff = Staff.new(f_name: "حسنعلی", l_name: "عبدخدایی جوینده", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid " do
    assert @staff.valid?
  end

end
