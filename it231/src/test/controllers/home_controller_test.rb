require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_home_url
    assert_response :success
  end

  test "should get dataset" do
    get home_dataset_url
    assert_response :success
  end

  test "should get browse" do
    get home_browse_url
    assert_response :success
  end

  test "should get search" do
    get home_search_url
    assert_response :success
  end

  test "should get login" do
    get home_login_url
    assert_response :success
  end

  test "should get logout" do
    get home_logout_url
    assert_response :success
  end

  test "should get newuser" do
    get home_newuser_url
    assert_response :success
  end

end
