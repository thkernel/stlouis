require 'test_helper'

class StockMovementReasonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_movement_reason = stock_movement_reasons(:one)
  end

  test "should get index" do
    get stock_movement_reasons_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_movement_reason_url
    assert_response :success
  end

  test "should create stock_movement_reason" do
    assert_difference('StockMovementReason.count') do
      post stock_movement_reasons_url, params: { stock_movement_reason: { account_id: @stock_movement_reason.account_id, description: @stock_movement_reason.description, name: @stock_movement_reason.name, status: @stock_movement_reason.status, uid: @stock_movement_reason.uid } }
    end

    assert_redirected_to stock_movement_reason_url(StockMovementReason.last)
  end

  test "should show stock_movement_reason" do
    get stock_movement_reason_url(@stock_movement_reason)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_movement_reason_url(@stock_movement_reason)
    assert_response :success
  end

  test "should update stock_movement_reason" do
    patch stock_movement_reason_url(@stock_movement_reason), params: { stock_movement_reason: { account_id: @stock_movement_reason.account_id, description: @stock_movement_reason.description, name: @stock_movement_reason.name, status: @stock_movement_reason.status, uid: @stock_movement_reason.uid } }
    assert_redirected_to stock_movement_reason_url(@stock_movement_reason)
  end

  test "should destroy stock_movement_reason" do
    assert_difference('StockMovementReason.count', -1) do
      delete stock_movement_reason_url(@stock_movement_reason)
    end

    assert_redirected_to stock_movement_reasons_url
  end
end
