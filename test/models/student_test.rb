require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    @student = Student.new(f_name: "سید محمّد مهدی", l_name: "علیمرادی فرد اعلا", father_name: "سید محمد ابولفضل", meli_code: "1742261272")
    @invalid_farsi_names = %w[abbasi jaffari رفیعی2]
  end

  test "should be valid" do
    assert @student.valid?
  end

  test "l_name should be presense" do
  	@student.l_name = "       "
  	assert_not @student.valid?
  end
  test "f_name should be presense" do
  	@student.f_name = "       "
  	assert_not @student.valid?
  end

  test "l_name should not be too long" do
  	@student.l_name = "a" * 36
  	assert_not @student.valid?
  end
  test "f_name should not be too long" do
  	@student.f_name = "a" * 26
  	assert_not @student.valid?
  end

  test "l_name should reject invalid farsi names" do
    @invalid_farsi_names.each do |invalid_name|
      @student.l_name = invalid_name
      assert_not @student.valid?, "#{invalid_name} should be invalid"
    end
  end
  test "f_name should reject invalid farsi names" do
    @invalid_farsi_names.each do |invalid_name|
      @student.f_name = invalid_name
      assert_not @student.valid?, "#{invalid_name} should be invalid"
    end
  end

  test "father_name should not be too long" do
  	@student.father_name = "a" * 26
  	assert_not @student.valid?
  end
  test "father_name should be presense" do
  	@student.father_name = "       "
  	assert_not @student.valid?
  end
  test "father_name should reject invalid farsi names" do
    @invalid_farsi_names.each do |invalid_name|
      @student.father_name = invalid_name
      assert_not @student.valid?, "#{invalid_name} should be invalid"
    end
  end

  test "meli_code should not be too long" do
  	@student.meli_code = "a" * 21
  	assert_not @student.valid?
  end
  test "meli_code should be presense" do
    @student.meli_code = "       "
    assert_not @student.valid?
  end
  test "meli_code should accept valid codes" do
    valid_codes = %w[ 1742261272 0311134157 0451537815 ]
    valid_codes.each do |valid_code|
      @student.meli_code = valid_code
      assert @student.valid?, "#{valid_code.inspect} should be valid"
    end
  end
  test "meli_code should reject invalid codes" do
    invalid_codes = %w[ 172942284 ]
    invalid_codes.each do |invalid_code|
      @student.meli_code = invalid_code
      assert_not @student.valid?, "#{invalid_code.inspect} should be invalid"
    end
  end
  test "meli_code should be unique" do
    --skip-test-unit
    duplicate_student = @student.dup
    duplicate_student.meli_code = @student.meli_code.upcase
    @student.save
    assert_not duplicate_student.valid?
  end


end
