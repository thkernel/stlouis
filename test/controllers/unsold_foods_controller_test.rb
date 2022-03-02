require 'test_helper'

class UnsoldFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unsold_food = unsold_foods(:one)
  end

  test "should get index" do
    get unsold_foods_url
    assert_response :success
  end

  test "should get new" do
    get new_unsold_food_url
    assert_response :success
  end

  test "should create unsold_food" do
    assert_difference('UnsoldFood.count') do
      post unsold_foods_url, params: { unsold_food: { account_id: @unsold_food.account_id, description: @unsold_food.description, food_id: @unsold_food.food_id, quantity: @unsold_food.quantity, status: @unsold_food.status, uid: @unsold_food.uid } }
    end

    assert_redirected_to unsold_food_url(UnsoldFood.last)
  end

  test "should show unsold_food" do
    get unsold_food_url(@unsold_food)
    assert_response :success
  end

  test "should get edit" do
    get edit_unsold_food_url(@unsold_food)
    assert_response :success
  end

  test "should update unsold_food" do
    patch unsold_food_url(@unsold_food), params: { unsold_food: { account_id: @unsold_food.account_id, description: @unsold_food.description, food_id: @unsold_food.food_id, quantity: @unsold_food.quantity, status: @unsold_food.status, uid: @unsold_food.uid } }
    assert_redirected_to unsold_food_url(@unsold_food)
  end

  test "should destroy unsold_food" do
    assert_difference('UnsoldFood.count', -1) do
      delete unsold_food_url(@unsold_food)
    end

    assert_redirected_to unsold_foods_url
  end
end
