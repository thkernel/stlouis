require "application_system_test_case"

class RestorationTechnicalSheetItemsTest < ApplicationSystemTestCase
  setup do
    @restoration_technical_sheet_item = restoration_technical_sheet_items(:one)
  end

  test "visiting the index" do
    visit restoration_technical_sheet_items_url
    assert_selector "h1", text: "Restoration Technical Sheet Items"
  end

  test "creating a Restoration technical sheet item" do
    visit restoration_technical_sheet_items_url
    click_on "New Restoration Technical Sheet Item"

    fill_in "Cost price excl tax", with: @restoration_technical_sheet_item.cost_price_excl_tax
    fill_in "Product", with: @restoration_technical_sheet_item.product_id
    fill_in "Quantity", with: @restoration_technical_sheet_item.quantity
    fill_in "Restoration technical sheet", with: @restoration_technical_sheet_item.restoration_technical_sheet_id
    fill_in "Uid", with: @restoration_technical_sheet_item.uid
    fill_in "Unity", with: @restoration_technical_sheet_item.unity_id
    fill_in "Unity purchase cost excl tax", with: @restoration_technical_sheet_item.unity_purchase_cost_excl_tax
    click_on "Create Restoration technical sheet item"

    assert_text "Restoration technical sheet item was successfully created"
    click_on "Back"
  end

  test "updating a Restoration technical sheet item" do
    visit restoration_technical_sheet_items_url
    click_on "Edit", match: :first

    fill_in "Cost price excl tax", with: @restoration_technical_sheet_item.cost_price_excl_tax
    fill_in "Product", with: @restoration_technical_sheet_item.product_id
    fill_in "Quantity", with: @restoration_technical_sheet_item.quantity
    fill_in "Restoration technical sheet", with: @restoration_technical_sheet_item.restoration_technical_sheet_id
    fill_in "Uid", with: @restoration_technical_sheet_item.uid
    fill_in "Unity", with: @restoration_technical_sheet_item.unity_id
    fill_in "Unity purchase cost excl tax", with: @restoration_technical_sheet_item.unity_purchase_cost_excl_tax
    click_on "Update Restoration technical sheet item"

    assert_text "Restoration technical sheet item was successfully updated"
    click_on "Back"
  end

  test "destroying a Restoration technical sheet item" do
    visit restoration_technical_sheet_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restoration technical sheet item was successfully destroyed"
  end
end
