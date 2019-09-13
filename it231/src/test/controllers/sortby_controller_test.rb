require 'test_helper'

class SortbyControllerTest < ActionDispatch::IntegrationTest
  test "should get srs" do
    get sortby_srs_url
    assert_response :success
  end

  test "should get vws" do
    get sortby_vws_url
    assert_response :success
  end

  test "should get hhr" do
    get sortby_hhr_url
    assert_response :success
  end

  test "should get net" do
    get sortby_net_url
    assert_response :success
  end

end
