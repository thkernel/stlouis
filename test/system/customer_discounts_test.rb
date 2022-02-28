require "application_system_test_case"

class CustomerDiscountsTest < ApplicationSystemTestCase
  setup do
    @customer_discount = customer_discounts(:one)
  end

  test "visiting the index" do
    visit customer_discounts_url
    assert_selector "h1", text: "Customer Discounts"
  end

  test "creating a Customer discount" do
    visit customer_discounts_url
    click_on "New Customer Discount"

    fill_in "Account", with: @customer_discount.account_id
    fill_in "Amount", with: @customer_discount.amount
    fill_in "Customer", with: @customer_discount.customer_id
    fill_in "Description", with: @customer_discount.description
    fill_in "Status", with: @customer_discount.status
    fill_in "Uid", with: @customer_discount.uid
    click_on "Create Customer discount"

    assert_text "Customer discount was successfully created"
    click_on "Back"
  end

  test "updating a Customer discount" do
    visit customer_discounts_url
    click_on "Edit", match: :first

    fill_in "Account", with: @customer_discount.account_id
    fill_in "Amount", with: @customer_discount.amount
    fill_in "Customer", with: @customer_discount.customer_id
    fill_in "Description", with: @customer_discount.description
    fill_in "Status", with: @customer_discount.status
    fill_in "Uid", with: @customer_discount.uid
    click_on "Update Customer discount"

    assert_text "Customer discount was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer discount" do
    visit customer_discounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer discount was successfully destroyed"
  end
end
