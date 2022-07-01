require "application_system_test_case"

class InventoriesTest < ApplicationSystemTestCase
  setup do
    @inventory = inventories(:one)
  end

  test "visiting the index" do
    visit inventories_url
    assert_selector "h1", text: "Inventories"
  end

  test "creating a Inventory" do
    visit inventories_url
    click_on "New Inventory"

    fill_in "Account", with: @inventory.account_id
    fill_in "Current stock", with: @inventory.current_stock
    fill_in "Description", with: @inventory.description
    fill_in "Difference", with: @inventory.difference
    fill_in "Inventory date", with: @inventory.inventory_date
    fill_in "Product", with: @inventory.product_id
    fill_in "Status", with: @inventory.status
    fill_in "Stock real", with: @inventory.stock_real
    fill_in "Uid", with: @inventory.uid
    click_on "Create Inventory"

    assert_text "Inventory was successfully created"
    click_on "Back"
  end

  test "updating a Inventory" do
    visit inventories_url
    click_on "Edit", match: :first

    fill_in "Account", with: @inventory.account_id
    fill_in "Current stock", with: @inventory.current_stock
    fill_in "Description", with: @inventory.description
    fill_in "Difference", with: @inventory.difference
    fill_in "Inventory date", with: @inventory.inventory_date
    fill_in "Product", with: @inventory.product_id
    fill_in "Status", with: @inventory.status
    fill_in "Stock real", with: @inventory.stock_real
    fill_in "Uid", with: @inventory.uid
    click_on "Update Inventory"

    assert_text "Inventory was successfully updated"
    click_on "Back"
  end

  test "destroying a Inventory" do
    visit inventories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inventory was successfully destroyed"
  end
end
