require 'test_helper'

class TimeUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_unit = time_units(:one)
  end

  test "should get index" do
    get time_units_url
    assert_response :success
  end

  test "should get new" do
    get new_time_unit_url
    assert_response :success
  end

  test "should create time_unit" do
    assert_difference('TimeUnit.count') do
      post time_units_url, params: { time_unit: { account_id: @time_unit.account_id, description: @time_unit.description, name: @time_unit.name, status: @time_unit.status, uid: @time_unit.uid } }
    end

    assert_redirected_to time_unit_url(TimeUnit.last)
  end

  test "should show time_unit" do
    get time_unit_url(@time_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_unit_url(@time_unit)
    assert_response :success
  end

  test "should update time_unit" do
    patch time_unit_url(@time_unit), params: { time_unit: { account_id: @time_unit.account_id, description: @time_unit.description, name: @time_unit.name, status: @time_unit.status, uid: @time_unit.uid } }
    assert_redirected_to time_unit_url(@time_unit)
  end

  test "should destroy time_unit" do
    assert_difference('TimeUnit.count', -1) do
      delete time_unit_url(@time_unit)
    end

    assert_redirected_to time_units_url
  end
end
