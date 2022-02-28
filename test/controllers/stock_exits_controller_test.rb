require 'test_helper'

class StockExitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_exit = stock_exits(:one)
  end

  test "should get index" do
    get stock_exits_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_exit_url
    assert_response :success
  end

  test "should create stock_exit" do
    assert_difference('StockExit.count') do
      post stock_exits_url, params: { stock_exit: { account_id: @stock_exit.account_id, description: @stock_exit.description, product_id: @stock_exit.product_id, quantity: @stock_exit.quantity, reason: @stock_exit.reason, status: @stock_exit.status, uid: @stock_exit.uid } }
    end

    assert_redirected_to stock_exit_url(StockExit.last)
  end

  test "should show stock_exit" do
    get stock_exit_url(@stock_exit)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_exit_url(@stock_exit)
    assert_response :success
  end

  test "should update stock_exit" do
    patch stock_exit_url(@stock_exit), params: { stock_exit: { account_id: @stock_exit.account_id, description: @stock_exit.description, product_id: @stock_exit.product_id, quantity: @stock_exit.quantity, reason: @stock_exit.reason, status: @stock_exit.status, uid: @stock_exit.uid } }
    assert_redirected_to stock_exit_url(@stock_exit)
  end

  test "should destroy stock_exit" do
    assert_difference('StockExit.count', -1) do
      delete stock_exit_url(@stock_exit)
    end

    assert_redirected_to stock_exits_url
  end
end
