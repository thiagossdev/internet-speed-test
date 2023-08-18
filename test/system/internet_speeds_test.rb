require "application_system_test_case"

class InternetSpeedsTest < ApplicationSystemTestCase
  setup do
    @internet_speed = internet_speeds(:one)
  end

  test "visiting the index" do
    visit internet_speeds_url
    assert_selector "h1", text: "Internet speeds"
  end

  test "should create internet speed" do
    visit internet_speeds_url
    click_on "New internet speed"

    fill_in "Download speed", with: @internet_speed.download_speed
    fill_in "Download units", with: @internet_speed.download_units
    fill_in "Place", with: @internet_speed.place_id
    click_on "Create Internet speed"

    assert_text "Internet speed was successfully created"
    click_on "Back"
  end

  test "should update Internet speed" do
    visit internet_speed_url(@internet_speed)
    click_on "Edit this internet speed", match: :first

    fill_in "Download speed", with: @internet_speed.download_speed
    fill_in "Download units", with: @internet_speed.download_units
    fill_in "Place", with: @internet_speed.place_id
    click_on "Update Internet speed"

    assert_text "Internet speed was successfully updated"
    click_on "Back"
  end

  test "should destroy Internet speed" do
    visit internet_speed_url(@internet_speed)
    click_on "Destroy this internet speed", match: :first

    assert_text "Internet speed was successfully destroyed"
  end
end
