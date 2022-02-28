require 'test_helper'

class CustomerFidelityCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_fidelity_card = customer_fidelity_cards(:one)
  end

  test "should get index" do
    get customer_fidelity_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_fidelity_card_url
    assert_response :success
  end

  test "should create customer_fidelity_card" do
    assert_difference('CustomerFidelityCard.count') do
      post customer_fidelity_cards_url, params: { customer_fidelity_card: { account_id: @customer_fidelity_card.account_id, customer_id: @customer_fidelity_card.customer_id, fidelity_card_id: @customer_fidelity_card.fidelity_card_id, status: @customer_fidelity_card.status, uid: @customer_fidelity_card.uid } }
    end

    assert_redirected_to customer_fidelity_card_url(CustomerFidelityCard.last)
  end

  test "should show customer_fidelity_card" do
    get customer_fidelity_card_url(@customer_fidelity_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_fidelity_card_url(@customer_fidelity_card)
    assert_response :success
  end

  test "should update customer_fidelity_card" do
    patch customer_fidelity_card_url(@customer_fidelity_card), params: { customer_fidelity_card: { account_id: @customer_fidelity_card.account_id, customer_id: @customer_fidelity_card.customer_id, fidelity_card_id: @customer_fidelity_card.fidelity_card_id, status: @customer_fidelity_card.status, uid: @customer_fidelity_card.uid } }
    assert_redirected_to customer_fidelity_card_url(@customer_fidelity_card)
  end

  test "should destroy customer_fidelity_card" do
    assert_difference('CustomerFidelityCard.count', -1) do
      delete customer_fidelity_card_url(@customer_fidelity_card)
    end

    assert_redirected_to customer_fidelity_cards_url
  end
end
