require 'test_helper'

class NeedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get needs_index_url
    assert_response :success
  end

  test "should get new" do
    get needs_new_url
    assert_response :success
  end

  test "should get create" do
    get needs_create_url
    assert_response :success
  end

  test "should get edit" do
    get needs_edit_url
    assert_response :success
  end

  test "should get update" do
    get needs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get needs_destroy_url
    assert_response :success
  end

end
