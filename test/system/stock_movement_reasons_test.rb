require "application_system_test_case"

class StockMovementReasonsTest < ApplicationSystemTestCase
  setup do
    @stock_movement_reason = stock_movement_reasons(:one)
  end

  test "visiting the index" do
    visit stock_movement_reasons_url
    assert_selector "h1", text: "Stock Movement Reasons"
  end

  test "creating a Stock movement reason" do
    visit stock_movement_reasons_url
    click_on "New Stock Movement Reason"

    fill_in "Account", with: @stock_movement_reason.account_id
    fill_in "Description", with: @stock_movement_reason.description
    fill_in "Name", with: @stock_movement_reason.name
    fill_in "Status", with: @stock_movement_reason.status
    fill_in "Uid", with: @stock_movement_reason.uid
    click_on "Create Stock movement reason"

    assert_text "Stock movement reason was successfully created"
    click_on "Back"
  end

  test "updating a Stock movement reason" do
    visit stock_movement_reasons_url
    click_on "Edit", match: :first

    fill_in "Account", with: @stock_movement_reason.account_id
    fill_in "Description", with: @stock_movement_reason.description
    fill_in "Name", with: @stock_movement_reason.name
    fill_in "Status", with: @stock_movement_reason.status
    fill_in "Uid", with: @stock_movement_reason.uid
    click_on "Update Stock movement reason"

    assert_text "Stock movement reason was successfully updated"
    click_on "Back"
  end

  test "destroying a Stock movement reason" do
    visit stock_movement_reasons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stock movement reason was successfully destroyed"
  end
end
