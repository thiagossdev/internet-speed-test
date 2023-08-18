require "test_helper"

class InternetSpeedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @internet_speed = internet_speeds(:one)
  end

  test "should get index" do
    get internet_speeds_url
    assert_response :success
  end

  test "should get new" do
    get new_internet_speed_url
    assert_response :success
  end

  test "should create internet_speed" do
    assert_difference("InternetSpeed.count") do
      post internet_speeds_url, params: { internet_speed: { download_speed: @internet_speed.download_speed, download_units: @internet_speed.download_units, place_id: @internet_speed.place_id } }
    end

    assert_redirected_to internet_speed_url(InternetSpeed.last)
  end

  test "should show internet_speed" do
    get internet_speed_url(@internet_speed)
    assert_response :success
  end

  test "should get edit" do
    get edit_internet_speed_url(@internet_speed)
    assert_response :success
  end

  test "should update internet_speed" do
    patch internet_speed_url(@internet_speed), params: { internet_speed: { download_speed: @internet_speed.download_speed, download_units: @internet_speed.download_units, place_id: @internet_speed.place_id } }
    assert_redirected_to internet_speed_url(@internet_speed)
  end

  test "should destroy internet_speed" do
    assert_difference("InternetSpeed.count", -1) do
      delete internet_speed_url(@internet_speed)
    end

    assert_redirected_to internet_speeds_url
  end
end
