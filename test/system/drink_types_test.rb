require "application_system_test_case"

class DrinkTypesTest < ApplicationSystemTestCase
  setup do
    @drink_type = drink_types(:one)
  end

  test "visiting the index" do
    visit drink_types_url
    assert_selector "h1", text: "Drink Types"
  end

  test "creating a Drink type" do
    visit drink_types_url
    click_on "New Drink Type"

    fill_in "Account", with: @drink_type.account_id
    fill_in "Description", with: @drink_type.description
    fill_in "Name", with: @drink_type.name
    fill_in "Status", with: @drink_type.status
    fill_in "Uid", with: @drink_type.uid
    click_on "Create Drink type"

    assert_text "Drink type was successfully created"
    click_on "Back"
  end

  test "updating a Drink type" do
    visit drink_types_url
    click_on "Edit", match: :first

    fill_in "Account", with: @drink_type.account_id
    fill_in "Description", with: @drink_type.description
    fill_in "Name", with: @drink_type.name
    fill_in "Status", with: @drink_type.status
    fill_in "Uid", with: @drink_type.uid
    click_on "Update Drink type"

    assert_text "Drink type was successfully updated"
    click_on "Back"
  end

  test "destroying a Drink type" do
    visit drink_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Drink type was successfully destroyed"
  end
end
