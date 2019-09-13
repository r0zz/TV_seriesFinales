require 'test_helper'

class FinaleRatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @finale_rating = finale_ratings(:one)
  end

  test "should get index" do
    get finale_ratings_url
    assert_response :success
  end

  test "should get new" do
    get new_finale_rating_url
    assert_response :success
  end

  test "should create finale_rating" do
    assert_difference('FinaleRating.count') do
      post finale_ratings_url, params: { finale_rating: { date: @finale_rating.date, householdrating: @finale_rating.householdrating, network: @finale_rating.network, series: @finale_rating.series, share: @finale_rating.share, viewership: @finale_rating.viewership } }
    end

    assert_redirected_to finale_rating_url(FinaleRating.last)
  end

  test "should show finale_rating" do
    get finale_rating_url(@finale_rating)
    assert_response :success
  end

  test "should get edit" do
    get edit_finale_rating_url(@finale_rating)
    assert_response :success
  end

  test "should update finale_rating" do
    patch finale_rating_url(@finale_rating), params: { finale_rating: { date: @finale_rating.date, householdrating: @finale_rating.householdrating, network: @finale_rating.network, series: @finale_rating.series, share: @finale_rating.share, viewership: @finale_rating.viewership } }
    assert_redirected_to finale_rating_url(@finale_rating)
  end

  test "should destroy finale_rating" do
    assert_difference('FinaleRating.count', -1) do
      delete finale_rating_url(@finale_rating)
    end

    assert_redirected_to finale_ratings_url
  end
end
