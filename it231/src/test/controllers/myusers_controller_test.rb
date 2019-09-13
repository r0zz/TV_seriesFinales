require 'test_helper'

class MyusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @myuser = myusers(:one)
  end

  test "should get index" do
    get myusers_url
    assert_response :success
  end

  test "should get new" do
    get new_myuser_url
    assert_response :success
  end

  test "should create myuser" do
    assert_difference('Myuser.count') do
      post myusers_url, params: { myuser: { email: @myuser.email, password: @myuser.password, username: @myuser.username, watched: @myuser.watched } }
    end

    assert_redirected_to myuser_url(Myuser.last)
  end

  test "should show myuser" do
    get myuser_url(@myuser)
    assert_response :success
  end

  test "should get edit" do
    get edit_myuser_url(@myuser)
    assert_response :success
  end

  test "should update myuser" do
    patch myuser_url(@myuser), params: { myuser: { email: @myuser.email, password: @myuser.password, username: @myuser.username, watched: @myuser.watched } }
    assert_redirected_to myuser_url(@myuser)
  end

  test "should destroy myuser" do
    assert_difference('Myuser.count', -1) do
      delete myuser_url(@myuser)
    end

    assert_redirected_to myusers_url
  end
end
