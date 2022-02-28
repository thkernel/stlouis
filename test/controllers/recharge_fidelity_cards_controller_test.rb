require 'test_helper'

class RechargeFidelityCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recharge_fidelity_card = recharge_fidelity_cards(:one)
  end

  test "should get index" do
    get recharge_fidelity_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_recharge_fidelity_card_url
    assert_response :success
  end

  test "should create recharge_fidelity_card" do
    assert_difference('RechargeFidelityCard.count') do
      post recharge_fidelity_cards_url, params: { recharge_fidelity_card: { account_id: @recharge_fidelity_card.account_id, amount: @recharge_fidelity_card.amount, status: @recharge_fidelity_card.status, uid: @recharge_fidelity_card.uid } }
    end

    assert_redirected_to recharge_fidelity_card_url(RechargeFidelityCard.last)
  end

  test "should show recharge_fidelity_card" do
    get recharge_fidelity_card_url(@recharge_fidelity_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_recharge_fidelity_card_url(@recharge_fidelity_card)
    assert_response :success
  end

  test "should update recharge_fidelity_card" do
    patch recharge_fidelity_card_url(@recharge_fidelity_card), params: { recharge_fidelity_card: { account_id: @recharge_fidelity_card.account_id, amount: @recharge_fidelity_card.amount, status: @recharge_fidelity_card.status, uid: @recharge_fidelity_card.uid } }
    assert_redirected_to recharge_fidelity_card_url(@recharge_fidelity_card)
  end

  test "should destroy recharge_fidelity_card" do
    assert_difference('RechargeFidelityCard.count', -1) do
      delete recharge_fidelity_card_url(@recharge_fidelity_card)
    end

    assert_redirected_to recharge_fidelity_cards_url
  end
end
