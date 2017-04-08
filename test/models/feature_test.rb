require 'test_helper'

class FeatureTest < ActiveSupport::TestCase
  def setup
    @feature = Feature.new(name: "اشتغال به تحصیل")
    @invalid_farsi_names = %w[abbasi jaffari رفیعی2]
  end

  test "should be valid" do
    assert @feature.valid?
  end

  test "should be presence" do
    @feature.name = "        "
    assert_not @feature.valid?
  end

  test "name should not be too short" do
      @feature.name = "س"
      assert_not @feature.valid?
  end

  test "name should not be too long" do
    @feature.name = "س"*46
    assert_not @feature.valid?
  end

  test "name should be unique" do
    dup_feature = @feature.dup
    @feature.save
    assert_not dup_feature.valid?
  end

  test "name should reject invalid farsi names" do
    @invalid_farsi_names.each do |invalid_name|
      @feature.name = invalid_name
      assert_not @feature.valid?, "#{invalid_name} should be invalid"
    end
  end
end
