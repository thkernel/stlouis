require "application_system_test_case"

class FoodCategoriesTest < ApplicationSystemTestCase
  setup do
    @food_category = food_categories(:one)
  end

  test "visiting the index" do
    visit food_categories_url
    assert_selector "h1", text: "Food Categories"
  end

  test "creating a Food category" do
    visit food_categories_url
    click_on "New Food Category"

    fill_in "Account", with: @food_category.account_id
    fill_in "Description", with: @food_category.description
    fill_in "Name", with: @food_category.name
    fill_in "Status", with: @food_category.status
    fill_in "Uid", with: @food_category.uid
    click_on "Create Food category"

    assert_text "Food category was successfully created"
    click_on "Back"
  end

  test "updating a Food category" do
    visit food_categories_url
    click_on "Edit", match: :first

    fill_in "Account", with: @food_category.account_id
    fill_in "Description", with: @food_category.description
    fill_in "Name", with: @food_category.name
    fill_in "Status", with: @food_category.status
    fill_in "Uid", with: @food_category.uid
    click_on "Update Food category"

    assert_text "Food category was successfully updated"
    click_on "Back"
  end

  test "destroying a Food category" do
    visit food_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Food category was successfully destroyed"
  end
end
