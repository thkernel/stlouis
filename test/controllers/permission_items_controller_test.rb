require 'test_helper'

class PermissionItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permission_item = permission_items(:one)
  end

  test "should get index" do
    get permission_items_url
    assert_response :success
  end

  test "should get new" do
    get new_permission_item_url
    assert_response :success
  end

  test "should create permission_item" do
    assert_difference('PermissionItem.count') do
      post permission_items_url, params: { permission_item: { action_name: @permission_item.action_name, permission_id: @permission_item.permission_id, status: @permission_item.status, uid: @permission_item.uid } }
    end

    assert_redirected_to permission_item_url(PermissionItem.last)
  end

  test "should show permission_item" do
    get permission_item_url(@permission_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_permission_item_url(@permission_item)
    assert_response :success
  end

  test "should update permission_item" do
    patch permission_item_url(@permission_item), params: { permission_item: { action_name: @permission_item.action_name, permission_id: @permission_item.permission_id, status: @permission_item.status, uid: @permission_item.uid } }
    assert_redirected_to permission_item_url(@permission_item)
  end

  test "should destroy permission_item" do
    assert_difference('PermissionItem.count', -1) do
      delete permission_item_url(@permission_item)
    end

    assert_redirected_to permission_items_url
  end
end
