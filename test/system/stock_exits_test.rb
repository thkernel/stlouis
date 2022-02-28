require "application_system_test_case"

class StockExitsTest < ApplicationSystemTestCase
  setup do
    @stock_exit = stock_exits(:one)
  end

  test "visiting the index" do
    visit stock_exits_url
    assert_selector "h1", text: "Stock Exits"
  end

  test "creating a Stock exit" do
    visit stock_exits_url
    click_on "New Stock Exit"

    fill_in "Account", with: @stock_exit.account_id
    fill_in "Description", with: @stock_exit.description
    fill_in "Product", with: @stock_exit.product_id
    fill_in "Quantity", with: @stock_exit.quantity
    fill_in "Reason", with: @stock_exit.reason
    fill_in "Status", with: @stock_exit.status
    fill_in "Uid", with: @stock_exit.uid
    click_on "Create Stock exit"

    assert_text "Stock exit was successfully created"
    click_on "Back"
  end

  test "updating a Stock exit" do
    visit stock_exits_url
    click_on "Edit", match: :first

    fill_in "Account", with: @stock_exit.account_id
    fill_in "Description", with: @stock_exit.description
    fill_in "Product", with: @stock_exit.product_id
    fill_in "Quantity", with: @stock_exit.quantity
    fill_in "Reason", with: @stock_exit.reason
    fill_in "Status", with: @stock_exit.status
    fill_in "Uid", with: @stock_exit.uid
    click_on "Update Stock exit"

    assert_text "Stock exit was successfully updated"
    click_on "Back"
  end

  test "destroying a Stock exit" do
    visit stock_exits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stock exit was successfully destroyed"
  end
end
