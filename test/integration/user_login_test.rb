require 'test_helper'

class StaffLoginTest < ActionDispatch::IntegrationTest

  def setup
    @staff = staffs(:jafari)
  end
  test "staff login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: {username: "", password: ""}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "staff login with valid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: {username: @staff.username, password: 'password'}
    assert_redirected_to requests_path
    follow_redirect!
    assert_template 'requests/index'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
  end
end
