require 'test_helper'

class NeedTest < ActiveSupport::TestCase
  def setup
    @need = Need.new(name: "تاریخ")
    @invalid_farsi_names = %w[abbasi jaffari رفیعی2]
  end

  test "should be valid" do
    assert @need.valid?
  end

  test "should be presence" do
    @need.name = "        "
    assert_not @need.valid?
  end

  test "name should not be too short" do
      @need.name = "س"
      assert_not @need.valid?
  end

  test "name should not be too long" do
    @need.name = "س"*46
    assert_not @need.valid?
  end

  test "name should reject invalid farsi names" do
    @invalid_farsi_names.each do |invalid_name|
      @need.name = invalid_name
      assert_not @need.valid?, "#{invalid_name} should be invalid"
    end
  end

end
