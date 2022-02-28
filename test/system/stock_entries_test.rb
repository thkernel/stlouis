require "application_system_test_case"

class StockEntriesTest < ApplicationSystemTestCase
  setup do
    @stock_entry = stock_entries(:one)
  end

  test "visiting the index" do
    visit stock_entries_url
    assert_selector "h1", text: "Stock Entries"
  end

  test "creating a Stock entry" do
    visit stock_entries_url
    click_on "New Stock Entry"

    fill_in "Account", with: @stock_entry.account_id
    fill_in "Description", with: @stock_entry.description
    fill_in "Product", with: @stock_entry.product_id
    fill_in "Quantity", with: @stock_entry.quantity
    fill_in "Reason", with: @stock_entry.reason
    fill_in "Status", with: @stock_entry.status
    fill_in "Uid", with: @stock_entry.uid
    click_on "Create Stock entry"

    assert_text "Stock entry was successfully created"
    click_on "Back"
  end

  test "updating a Stock entry" do
    visit stock_entries_url
    click_on "Edit", match: :first

    fill_in "Account", with: @stock_entry.account_id
    fill_in "Description", with: @stock_entry.description
    fill_in "Product", with: @stock_entry.product_id
    fill_in "Quantity", with: @stock_entry.quantity
    fill_in "Reason", with: @stock_entry.reason
    fill_in "Status", with: @stock_entry.status
    fill_in "Uid", with: @stock_entry.uid
    click_on "Update Stock entry"

    assert_text "Stock entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Stock entry" do
    visit stock_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stock entry was successfully destroyed"
  end
end
