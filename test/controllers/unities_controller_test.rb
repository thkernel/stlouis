require 'test_helper'

class UnitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unity = unities(:one)
  end

  test "should get index" do
    get unities_url
    assert_response :success
  end

  test "should get new" do
    get new_unity_url
    assert_response :success
  end

  test "should create unity" do
    assert_difference('Unity.count') do
      post unities_url, params: { unity: { account_id: @unity.account_id, decription: @unity.decription, name: @unity.name, status: @unity.status, uid: @unity.uid } }
    end

    assert_redirected_to unity_url(Unity.last)
  end

  test "should show unity" do
    get unity_url(@unity)
    assert_response :success
  end

  test "should get edit" do
    get edit_unity_url(@unity)
    assert_response :success
  end

  test "should update unity" do
    patch unity_url(@unity), params: { unity: { account_id: @unity.account_id, decription: @unity.decription, name: @unity.name, status: @unity.status, uid: @unity.uid } }
    assert_redirected_to unity_url(@unity)
  end

  test "should destroy unity" do
    assert_difference('Unity.count', -1) do
      delete unity_url(@unity)
    end

    assert_redirected_to unities_url
  end
end
