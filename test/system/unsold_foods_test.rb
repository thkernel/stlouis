require "application_system_test_case"

class UnsoldFoodsTest < ApplicationSystemTestCase
  setup do
    @unsold_food = unsold_foods(:one)
  end

  test "visiting the index" do
    visit unsold_foods_url
    assert_selector "h1", text: "Unsold Foods"
  end

  test "creating a Unsold food" do
    visit unsold_foods_url
    click_on "New Unsold Food"

    fill_in "Account", with: @unsold_food.account_id
    fill_in "Description", with: @unsold_food.description
    fill_in "Food", with: @unsold_food.food_id
    fill_in "Quantity", with: @unsold_food.quantity
    fill_in "Status", with: @unsold_food.status
    fill_in "Uid", with: @unsold_food.uid
    click_on "Create Unsold food"

    assert_text "Unsold food was successfully created"
    click_on "Back"
  end

  test "updating a Unsold food" do
    visit unsold_foods_url
    click_on "Edit", match: :first

    fill_in "Account", with: @unsold_food.account_id
    fill_in "Description", with: @unsold_food.description
    fill_in "Food", with: @unsold_food.food_id
    fill_in "Quantity", with: @unsold_food.quantity
    fill_in "Status", with: @unsold_food.status
    fill_in "Uid", with: @unsold_food.uid
    click_on "Update Unsold food"

    assert_text "Unsold food was successfully updated"
    click_on "Back"
  end

  test "destroying a Unsold food" do
    visit unsold_foods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unsold food was successfully destroyed"
  end
end
