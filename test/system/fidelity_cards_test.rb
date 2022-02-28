require "application_system_test_case"

class FidelityCardsTest < ApplicationSystemTestCase
  setup do
    @fidelity_card = fidelity_cards(:one)
  end

  test "visiting the index" do
    visit fidelity_cards_url
    assert_selector "h1", text: "Fidelity Cards"
  end

  test "creating a Fidelity card" do
    visit fidelity_cards_url
    click_on "New Fidelity Card"

    fill_in "Account", with: @fidelity_card.account_id
    fill_in "Balance", with: @fidelity_card.balance
    fill_in "Status", with: @fidelity_card.status
    fill_in "Uid", with: @fidelity_card.uid
    click_on "Create Fidelity card"

    assert_text "Fidelity card was successfully created"
    click_on "Back"
  end

  test "updating a Fidelity card" do
    visit fidelity_cards_url
    click_on "Edit", match: :first

    fill_in "Account", with: @fidelity_card.account_id
    fill_in "Balance", with: @fidelity_card.balance
    fill_in "Status", with: @fidelity_card.status
    fill_in "Uid", with: @fidelity_card.uid
    click_on "Update Fidelity card"

    assert_text "Fidelity card was successfully updated"
    click_on "Back"
  end

  test "destroying a Fidelity card" do
    visit fidelity_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fidelity card was successfully destroyed"
  end
end
