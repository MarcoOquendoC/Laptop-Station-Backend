require "test_helper"

class ReservesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reserf = reserves(:one)
  end

  test "should get index" do
    get reserves_url, as: :json
    assert_response :success
  end

  test "should create reserf" do
    assert_difference("Reserve.count") do
      post reserves_url, params: { reserf: { date: @reserf.date, item_id_id: @reserf.item_id_id, user_id_id: @reserf.user_id_id } }, as: :json
    end

    assert_response :created
  end

  test "should show reserf" do
    get reserf_url(@reserf), as: :json
    assert_response :success
  end

  test "should update reserf" do
    patch reserf_url(@reserf), params: { reserf: { date: @reserf.date, item_id_id: @reserf.item_id_id, user_id_id: @reserf.user_id_id } }, as: :json
    assert_response :success
  end

  test "should destroy reserf" do
    assert_difference("Reserve.count", -1) do
      delete reserf_url(@reserf), as: :json
    end

    assert_response :no_content
  end
end
