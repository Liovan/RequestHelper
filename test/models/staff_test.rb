require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  def setup
    @invalid_farsi_names = %w[abbasi jaffari رفیعی2]
    place=Place.new(name:"amozesh")
    @staff = Staff.new(f_name: "سید محمّد مهدی", l_name: "علیمرادی فرد اعلا",place: place, username: "mahdi", password: "foobar")
  end

  test "should be valid" do
    assert @staff.valid?
  end

  test "l_name should be presence" do
  	@staff.l_name = "       "
  	assert_not @staff.valid?
  end
  test "f_name should be presence" do
  	@staff.f_name = "       "
  	assert_not @staff.valid?
  end

  test "l_name should not be too long" do
  	@staff.l_name = "a" * 31
  	assert_not @staff.valid?
  end
  test "f_name should not be too long" do
  	@staff.f_name = "a" * 26
  	assert_not @staff.valid?
  end

  test "l_name should reject invalid farsi names" do
    @invalid_farsi_names.each do |invalid_name|
      @staff.l_name = invalid_name
      assert_not @staff.valid?, "#{invalid_name} should be invalid"
    end
  end
  test "f_name should reject invalid farsi names" do
    @invalid_farsi_names.each do |invalid_name|
      @staff.f_name = invalid_name
      assert_not @staff.valid?, "#{invalid_name} should be invalid"
    end
  end

  test "username should not be too long" do
  	@staff.username = "a" * 26
  	assert_not @staff.valid?
  end
  test "username should not be too short" do
  	@staff.username = "a" * 4
  	assert_not @staff.valid?
  end

  test "username should be unique" do
  	duplicate_staff = @staff.dup
  	duplicate_staff.username.upcase! # @staff.username.upcase
  	@staff.save
  	assert_not duplicate_staff.valid?
  end

  test "password should not be too short" do
  	@staff.password = "a" * 5
  	assert_not @staff.valid?
  end


end
