require "application_system_test_case"

class BonusTest < ApplicationSystemTestCase
  setup do
    @bonu = bonus(:one)
  end

  test "visiting the index" do
    visit bonus_url
    assert_selector "h1", text: "Bonus"
  end

  test "creating a Bonu" do
    visit bonus_url
    click_on "New Bonu"

    fill_in "Bonus number", with: @bonu.bonus_number
    fill_in "Customer", with: @bonu.customer_id
    fill_in "Food quantity", with: @bonu.food_quantity
    fill_in "Status", with: @bonu.status
    fill_in "Uid", with: @bonu.uid
    click_on "Create Bonu"

    assert_text "Bonu was successfully created"
    click_on "Back"
  end

  test "updating a Bonu" do
    visit bonus_url
    click_on "Edit", match: :first

    fill_in "Bonus number", with: @bonu.bonus_number
    fill_in "Customer", with: @bonu.customer_id
    fill_in "Food quantity", with: @bonu.food_quantity
    fill_in "Status", with: @bonu.status
    fill_in "Uid", with: @bonu.uid
    click_on "Update Bonu"

    assert_text "Bonu was successfully updated"
    click_on "Back"
  end

  test "destroying a Bonu" do
    visit bonus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bonu was successfully destroyed"
  end
end
