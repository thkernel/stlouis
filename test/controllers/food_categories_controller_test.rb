require 'test_helper'

class FoodCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_category = food_categories(:one)
  end

  test "should get index" do
    get food_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_food_category_url
    assert_response :success
  end

  test "should create food_category" do
    assert_difference('FoodCategory.count') do
      post food_categories_url, params: { food_category: { account_id: @food_category.account_id, description: @food_category.description, name: @food_category.name, status: @food_category.status, uid: @food_category.uid } }
    end

    assert_redirected_to food_category_url(FoodCategory.last)
  end

  test "should show food_category" do
    get food_category_url(@food_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_category_url(@food_category)
    assert_response :success
  end

  test "should update food_category" do
    patch food_category_url(@food_category), params: { food_category: { account_id: @food_category.account_id, description: @food_category.description, name: @food_category.name, status: @food_category.status, uid: @food_category.uid } }
    assert_redirected_to food_category_url(@food_category)
  end

  test "should destroy food_category" do
    assert_difference('FoodCategory.count', -1) do
      delete food_category_url(@food_category)
    end

    assert_redirected_to food_categories_url
  end
end
