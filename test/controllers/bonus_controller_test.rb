require 'test_helper'

class BonusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bonu = bonus(:one)
  end

  test "should get index" do
    get bonus_url
    assert_response :success
  end

  test "should get new" do
    get new_bonu_url
    assert_response :success
  end

  test "should create bonu" do
    assert_difference('Bonu.count') do
      post bonus_url, params: { bonu: { bonus_number: @bonu.bonus_number, customer_id: @bonu.customer_id, food_quantity: @bonu.food_quantity, status: @bonu.status, uid: @bonu.uid } }
    end

    assert_redirected_to bonu_url(Bonu.last)
  end

  test "should show bonu" do
    get bonu_url(@bonu)
    assert_response :success
  end

  test "should get edit" do
    get edit_bonu_url(@bonu)
    assert_response :success
  end

  test "should update bonu" do
    patch bonu_url(@bonu), params: { bonu: { bonus_number: @bonu.bonus_number, customer_id: @bonu.customer_id, food_quantity: @bonu.food_quantity, status: @bonu.status, uid: @bonu.uid } }
    assert_redirected_to bonu_url(@bonu)
  end

  test "should destroy bonu" do
    assert_difference('Bonu.count', -1) do
      delete bonu_url(@bonu)
    end

    assert_redirected_to bonus_url
  end
end
