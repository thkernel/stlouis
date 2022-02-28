require "application_system_test_case"

class OrderItemDrinksTest < ApplicationSystemTestCase
  setup do
    @order_item_drink = order_item_drinks(:one)
  end

  test "visiting the index" do
    visit order_item_drinks_url
    assert_selector "h1", text: "Order Item Drinks"
  end

  test "creating a Order item drink" do
    visit order_item_drinks_url
    click_on "New Order Item Drink"

    fill_in "Amount", with: @order_item_drink.amount
    fill_in "Order", with: @order_item_drink.order_id
    fill_in "Product", with: @order_item_drink.product_id
    fill_in "Quantity", with: @order_item_drink.quantity
    fill_in "Unit price", with: @order_item_drink.unit_price
    click_on "Create Order item drink"

    assert_text "Order item drink was successfully created"
    click_on "Back"
  end

  test "updating a Order item drink" do
    visit order_item_drinks_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @order_item_drink.amount
    fill_in "Order", with: @order_item_drink.order_id
    fill_in "Product", with: @order_item_drink.product_id
    fill_in "Quantity", with: @order_item_drink.quantity
    fill_in "Unit price", with: @order_item_drink.unit_price
    click_on "Update Order item drink"

    assert_text "Order item drink was successfully updated"
    click_on "Back"
  end

  test "destroying a Order item drink" do
    visit order_item_drinks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order item drink was successfully destroyed"
  end
end
