require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  def setup
    @place =Place.new(name: "مدیر آموزش")
    @invalid_farsi_names = %w[abbasi jaffari رفیعی2]
  end

  test "should be valid" do
    assert @place.valid?
  end

  test "should be presence" do
    @place.name = "        "
    assert_not @place.valid?
  end

  test "name should not be too short" do
      @place.name = "س"
      assert_not @place.valid?
  end

  test "name should not be too long" do
    @place.name = "س"*46
    assert_not @place.valid?
  end

  test "name should be unique" do
    dup_place = @place.dup
    @place.save
    assert_not dup_place.valid?
  end

  test "name should reject invalid farsi names" do
    @invalid_farsi_names.each do |invalid_name|
      @place.name = invalid_name
      assert_not @place.valid?, "#{invalid_name} should be invalid"
    end
  end
end
