require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  def setup
    place=Place.new(name:"amozesh")
    @staff = Staff.new(f_name: "mahdi", l_name: "alh",place: place, password: "foobar")
  end

  test "should be valid" do
    assert @staff.valid?
  end

end
