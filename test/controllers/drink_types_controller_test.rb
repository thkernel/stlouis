require 'test_helper'

class DrinkTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drink_type = drink_types(:one)
  end

  test "should get index" do
    get drink_types_url
    assert_response :success
  end

  test "should get new" do
    get new_drink_type_url
    assert_response :success
  end

  test "should create drink_type" do
    assert_difference('DrinkType.count') do
      post drink_types_url, params: { drink_type: { account_id: @drink_type.account_id, description: @drink_type.description, name: @drink_type.name, status: @drink_type.status, uid: @drink_type.uid } }
    end

    assert_redirected_to drink_type_url(DrinkType.last)
  end

  test "should show drink_type" do
    get drink_type_url(@drink_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_drink_type_url(@drink_type)
    assert_response :success
  end

  test "should update drink_type" do
    patch drink_type_url(@drink_type), params: { drink_type: { account_id: @drink_type.account_id, description: @drink_type.description, name: @drink_type.name, status: @drink_type.status, uid: @drink_type.uid } }
    assert_redirected_to drink_type_url(@drink_type)
  end

  test "should destroy drink_type" do
    assert_difference('DrinkType.count', -1) do
      delete drink_type_url(@drink_type)
    end

    assert_redirected_to drink_types_url
  end
end
