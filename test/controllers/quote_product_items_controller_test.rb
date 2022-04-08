require 'test_helper'

class QuoteProductItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote_product_item = quote_product_items(:one)
  end

  test "should get index" do
    get quote_product_items_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_product_item_url
    assert_response :success
  end

  test "should create quote_product_item" do
    assert_difference('QuoteProductItem.count') do
      post quote_product_items_url, params: { quote_product_item: { uid: @quote_product_item.uid } }
    end

    assert_redirected_to quote_product_item_url(QuoteProductItem.last)
  end

  test "should show quote_product_item" do
    get quote_product_item_url(@quote_product_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_product_item_url(@quote_product_item)
    assert_response :success
  end

  test "should update quote_product_item" do
    patch quote_product_item_url(@quote_product_item), params: { quote_product_item: { uid: @quote_product_item.uid } }
    assert_redirected_to quote_product_item_url(@quote_product_item)
  end

  test "should destroy quote_product_item" do
    assert_difference('QuoteProductItem.count', -1) do
      delete quote_product_item_url(@quote_product_item)
    end

    assert_redirected_to quote_product_items_url
  end
end
