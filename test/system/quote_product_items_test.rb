require "application_system_test_case"

class QuoteProductItemsTest < ApplicationSystemTestCase
  setup do
    @quote_product_item = quote_product_items(:one)
  end

  test "visiting the index" do
    visit quote_product_items_url
    assert_selector "h1", text: "Quote Product Items"
  end

  test "creating a Quote product item" do
    visit quote_product_items_url
    click_on "New Quote Product Item"

    fill_in "Uid", with: @quote_product_item.uid
    click_on "Create Quote product item"

    assert_text "Quote product item was successfully created"
    click_on "Back"
  end

  test "updating a Quote product item" do
    visit quote_product_items_url
    click_on "Edit", match: :first

    fill_in "Uid", with: @quote_product_item.uid
    click_on "Update Quote product item"

    assert_text "Quote product item was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote product item" do
    visit quote_product_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote product item was successfully destroyed"
  end
end
