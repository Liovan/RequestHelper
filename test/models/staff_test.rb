require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  def setup
    place=Place.new(name:"amozesh")
    @staff = Staff.new(f_name: "mahdi", l_name: "alh",place: place, username: "Jaffari", password: "foobar")
  end

  test "should be valid" do
    assert @staff.valid?
  end

  test "l_name should be present" do
  	@staff.l_name = "       "
  	assert_not @staff.valid?
  end
  test "f_name should be present" do
  	@staff.f_name = "       "
  	assert_not @staff.valid?
  end

  test "l_name should not be too long" do
  	@staff.l_name = "a" * 51
  	assert_not @staff.valid?
  end
  test "f_name should not be too long" do
  	@staff.f_name = "a" * 51
  	assert_not @staff.valid?
  end

  test "username should not be too long" do
  	@staff.username = "a" * 26
  	assert_not @staff.valid?
  end

  test "username should be unique" do
  	duplicate_staff = @staff.dup
  	duplicate_staff.username.upcase! #= @staff.username.upcase 
  	@staff.save
  	assert_not duplicate_staff.valid?
  end

end
