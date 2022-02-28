require 'test_helper'

class OrderItemDrinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_item_drink = order_item_drinks(:one)
  end

  test "should get index" do
    get order_item_drinks_url
    assert_response :success
  end

  test "should get new" do
    get new_order_item_drink_url
    assert_response :success
  end

  test "should create order_item_drink" do
    assert_difference('OrderItemDrink.count') do
      post order_item_drinks_url, params: { order_item_drink: { amount: @order_item_drink.amount, order_id: @order_item_drink.order_id, product_id: @order_item_drink.product_id, quantity: @order_item_drink.quantity, unit_price: @order_item_drink.unit_price } }
    end

    assert_redirected_to order_item_drink_url(OrderItemDrink.last)
  end

  test "should show order_item_drink" do
    get order_item_drink_url(@order_item_drink)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_item_drink_url(@order_item_drink)
    assert_response :success
  end

  test "should update order_item_drink" do
    patch order_item_drink_url(@order_item_drink), params: { order_item_drink: { amount: @order_item_drink.amount, order_id: @order_item_drink.order_id, product_id: @order_item_drink.product_id, quantity: @order_item_drink.quantity, unit_price: @order_item_drink.unit_price } }
    assert_redirected_to order_item_drink_url(@order_item_drink)
  end

  test "should destroy order_item_drink" do
    assert_difference('OrderItemDrink.count', -1) do
      delete order_item_drink_url(@order_item_drink)
    end

    assert_redirected_to order_item_drinks_url
  end
end
