require "application_system_test_case"

class TimeUnitsTest < ApplicationSystemTestCase
  setup do
    @time_unit = time_units(:one)
  end

  test "visiting the index" do
    visit time_units_url
    assert_selector "h1", text: "Time Units"
  end

  test "creating a Time unit" do
    visit time_units_url
    click_on "New Time Unit"

    fill_in "Account", with: @time_unit.account_id
    fill_in "Description", with: @time_unit.description
    fill_in "Name", with: @time_unit.name
    fill_in "Status", with: @time_unit.status
    fill_in "Uid", with: @time_unit.uid
    click_on "Create Time unit"

    assert_text "Time unit was successfully created"
    click_on "Back"
  end

  test "updating a Time unit" do
    visit time_units_url
    click_on "Edit", match: :first

    fill_in "Account", with: @time_unit.account_id
    fill_in "Description", with: @time_unit.description
    fill_in "Name", with: @time_unit.name
    fill_in "Status", with: @time_unit.status
    fill_in "Uid", with: @time_unit.uid
    click_on "Update Time unit"

    assert_text "Time unit was successfully updated"
    click_on "Back"
  end

  test "destroying a Time unit" do
    visit time_units_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time unit was successfully destroyed"
  end
end
