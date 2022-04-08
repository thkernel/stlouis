require 'test_helper'

class InvoiceFoodItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_food_item = invoice_food_items(:one)
  end

  test "should get index" do
    get invoice_food_items_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_food_item_url
    assert_response :success
  end

  test "should create invoice_food_item" do
    assert_difference('InvoiceFoodItem.count') do
      post invoice_food_items_url, params: { invoice_food_item: { uid: @invoice_food_item.uid } }
    end

    assert_redirected_to invoice_food_item_url(InvoiceFoodItem.last)
  end

  test "should show invoice_food_item" do
    get invoice_food_item_url(@invoice_food_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_food_item_url(@invoice_food_item)
    assert_response :success
  end

  test "should update invoice_food_item" do
    patch invoice_food_item_url(@invoice_food_item), params: { invoice_food_item: { uid: @invoice_food_item.uid } }
    assert_redirected_to invoice_food_item_url(@invoice_food_item)
  end

  test "should destroy invoice_food_item" do
    assert_difference('InvoiceFoodItem.count', -1) do
      delete invoice_food_item_url(@invoice_food_item)
    end

    assert_redirected_to invoice_food_items_url
  end
end
