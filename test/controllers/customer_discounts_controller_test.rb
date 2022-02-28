require 'test_helper'

class CustomerDiscountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_discount = customer_discounts(:one)
  end

  test "should get index" do
    get customer_discounts_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_discount_url
    assert_response :success
  end

  test "should create customer_discount" do
    assert_difference('CustomerDiscount.count') do
      post customer_discounts_url, params: { customer_discount: { account_id: @customer_discount.account_id, amount: @customer_discount.amount, customer_id: @customer_discount.customer_id, description: @customer_discount.description, status: @customer_discount.status, uid: @customer_discount.uid } }
    end

    assert_redirected_to customer_discount_url(CustomerDiscount.last)
  end

  test "should show customer_discount" do
    get customer_discount_url(@customer_discount)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_discount_url(@customer_discount)
    assert_response :success
  end

  test "should update customer_discount" do
    patch customer_discount_url(@customer_discount), params: { customer_discount: { account_id: @customer_discount.account_id, amount: @customer_discount.amount, customer_id: @customer_discount.customer_id, description: @customer_discount.description, status: @customer_discount.status, uid: @customer_discount.uid } }
    assert_redirected_to customer_discount_url(@customer_discount)
  end

  test "should destroy customer_discount" do
    assert_difference('CustomerDiscount.count', -1) do
      delete customer_discount_url(@customer_discount)
    end

    assert_redirected_to customer_discounts_url
  end
end
