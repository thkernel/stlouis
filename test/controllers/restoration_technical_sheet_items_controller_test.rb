require 'test_helper'

class RestorationTechnicalSheetItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restoration_technical_sheet_item = restoration_technical_sheet_items(:one)
  end

  test "should get index" do
    get restoration_technical_sheet_items_url
    assert_response :success
  end

  test "should get new" do
    get new_restoration_technical_sheet_item_url
    assert_response :success
  end

  test "should create restoration_technical_sheet_item" do
    assert_difference('RestorationTechnicalSheetItem.count') do
      post restoration_technical_sheet_items_url, params: { restoration_technical_sheet_item: { cost_price_excl_tax: @restoration_technical_sheet_item.cost_price_excl_tax, product_id: @restoration_technical_sheet_item.product_id, quantity: @restoration_technical_sheet_item.quantity, restoration_technical_sheet_id: @restoration_technical_sheet_item.restoration_technical_sheet_id, uid: @restoration_technical_sheet_item.uid, unity_id: @restoration_technical_sheet_item.unity_id, unity_purchase_cost_excl_tax: @restoration_technical_sheet_item.unity_purchase_cost_excl_tax } }
    end

    assert_redirected_to restoration_technical_sheet_item_url(RestorationTechnicalSheetItem.last)
  end

  test "should show restoration_technical_sheet_item" do
    get restoration_technical_sheet_item_url(@restoration_technical_sheet_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_restoration_technical_sheet_item_url(@restoration_technical_sheet_item)
    assert_response :success
  end

  test "should update restoration_technical_sheet_item" do
    patch restoration_technical_sheet_item_url(@restoration_technical_sheet_item), params: { restoration_technical_sheet_item: { cost_price_excl_tax: @restoration_technical_sheet_item.cost_price_excl_tax, product_id: @restoration_technical_sheet_item.product_id, quantity: @restoration_technical_sheet_item.quantity, restoration_technical_sheet_id: @restoration_technical_sheet_item.restoration_technical_sheet_id, uid: @restoration_technical_sheet_item.uid, unity_id: @restoration_technical_sheet_item.unity_id, unity_purchase_cost_excl_tax: @restoration_technical_sheet_item.unity_purchase_cost_excl_tax } }
    assert_redirected_to restoration_technical_sheet_item_url(@restoration_technical_sheet_item)
  end

  test "should destroy restoration_technical_sheet_item" do
    assert_difference('RestorationTechnicalSheetItem.count', -1) do
      delete restoration_technical_sheet_item_url(@restoration_technical_sheet_item)
    end

    assert_redirected_to restoration_technical_sheet_items_url
  end
end
