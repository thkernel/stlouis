require 'test_helper'

class FidelityCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fidelity_card = fidelity_cards(:one)
  end

  test "should get index" do
    get fidelity_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_fidelity_card_url
    assert_response :success
  end

  test "should create fidelity_card" do
    assert_difference('FidelityCard.count') do
      post fidelity_cards_url, params: { fidelity_card: { account_id: @fidelity_card.account_id, balance: @fidelity_card.balance, status: @fidelity_card.status, uid: @fidelity_card.uid } }
    end

    assert_redirected_to fidelity_card_url(FidelityCard.last)
  end

  test "should show fidelity_card" do
    get fidelity_card_url(@fidelity_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_fidelity_card_url(@fidelity_card)
    assert_response :success
  end

  test "should update fidelity_card" do
    patch fidelity_card_url(@fidelity_card), params: { fidelity_card: { account_id: @fidelity_card.account_id, balance: @fidelity_card.balance, status: @fidelity_card.status, uid: @fidelity_card.uid } }
    assert_redirected_to fidelity_card_url(@fidelity_card)
  end

  test "should destroy fidelity_card" do
    assert_difference('FidelityCard.count', -1) do
      delete fidelity_card_url(@fidelity_card)
    end

    assert_redirected_to fidelity_cards_url
  end
end
