require 'test_helper'

class ImportStudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get import_students_index_url
    assert_response :success
  end

  test "should get new" do
    get import_students_new_url
    assert_response :success
  end

  test "should get create" do
    get import_students_create_url
    assert_response :success
  end

  test "should get destroy" do
    get import_students_destroy_url
    assert_response :success
  end

end
