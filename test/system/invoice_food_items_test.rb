require "application_system_test_case"

class InvoiceFoodItemsTest < ApplicationSystemTestCase
  setup do
    @invoice_food_item = invoice_food_items(:one)
  end

  test "visiting the index" do
    visit invoice_food_items_url
    assert_selector "h1", text: "Invoice Food Items"
  end

  test "creating a Invoice food item" do
    visit invoice_food_items_url
    click_on "New Invoice Food Item"

    fill_in "Uid", with: @invoice_food_item.uid
    click_on "Create Invoice food item"

    assert_text "Invoice food item was successfully created"
    click_on "Back"
  end

  test "updating a Invoice food item" do
    visit invoice_food_items_url
    click_on "Edit", match: :first

    fill_in "Uid", with: @invoice_food_item.uid
    click_on "Update Invoice food item"

    assert_text "Invoice food item was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice food item" do
    visit invoice_food_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice food item was successfully destroyed"
  end
end
