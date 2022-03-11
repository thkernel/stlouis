require "application_system_test_case"

class GiftsTest < ApplicationSystemTestCase
  setup do
    @gift = gifts(:one)
  end

  test "visiting the index" do
    visit gifts_url
    assert_selector "h1", text: "Gifts"
  end

  test "creating a Gift" do
    visit gifts_url
    click_on "New Gift"

    fill_in "Bonus number", with: @gift.bonus_number
    fill_in "Customer", with: @gift.customer_id
    fill_in "Food quantity", with: @gift.food_quantity
    fill_in "Status", with: @gift.status
    fill_in "Uid", with: @gift.uid
    click_on "Create Gift"

    assert_text "Gift was successfully created"
    click_on "Back"
  end

  test "updating a Gift" do
    visit gifts_url
    click_on "Edit", match: :first

    fill_in "Bonus number", with: @gift.bonus_number
    fill_in "Customer", with: @gift.customer_id
    fill_in "Food quantity", with: @gift.food_quantity
    fill_in "Status", with: @gift.status
    fill_in "Uid", with: @gift.uid
    click_on "Update Gift"

    assert_text "Gift was successfully updated"
    click_on "Back"
  end

  test "destroying a Gift" do
    visit gifts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gift was successfully destroyed"
  end
end
