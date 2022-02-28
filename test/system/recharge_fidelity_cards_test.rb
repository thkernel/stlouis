require "application_system_test_case"

class RechargeFidelityCardsTest < ApplicationSystemTestCase
  setup do
    @recharge_fidelity_card = recharge_fidelity_cards(:one)
  end

  test "visiting the index" do
    visit recharge_fidelity_cards_url
    assert_selector "h1", text: "Recharge Fidelity Cards"
  end

  test "creating a Recharge fidelity card" do
    visit recharge_fidelity_cards_url
    click_on "New Recharge Fidelity Card"

    fill_in "Account", with: @recharge_fidelity_card.account_id
    fill_in "Amount", with: @recharge_fidelity_card.amount
    fill_in "Status", with: @recharge_fidelity_card.status
    fill_in "Uid", with: @recharge_fidelity_card.uid
    click_on "Create Recharge fidelity card"

    assert_text "Recharge fidelity card was successfully created"
    click_on "Back"
  end

  test "updating a Recharge fidelity card" do
    visit recharge_fidelity_cards_url
    click_on "Edit", match: :first

    fill_in "Account", with: @recharge_fidelity_card.account_id
    fill_in "Amount", with: @recharge_fidelity_card.amount
    fill_in "Status", with: @recharge_fidelity_card.status
    fill_in "Uid", with: @recharge_fidelity_card.uid
    click_on "Update Recharge fidelity card"

    assert_text "Recharge fidelity card was successfully updated"
    click_on "Back"
  end

  test "destroying a Recharge fidelity card" do
    visit recharge_fidelity_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recharge fidelity card was successfully destroyed"
  end
end
