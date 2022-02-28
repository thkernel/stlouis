require "application_system_test_case"

class CustomerFidelityCardsTest < ApplicationSystemTestCase
  setup do
    @customer_fidelity_card = customer_fidelity_cards(:one)
  end

  test "visiting the index" do
    visit customer_fidelity_cards_url
    assert_selector "h1", text: "Customer Fidelity Cards"
  end

  test "creating a Customer fidelity card" do
    visit customer_fidelity_cards_url
    click_on "New Customer Fidelity Card"

    fill_in "Account", with: @customer_fidelity_card.account_id
    fill_in "Customer", with: @customer_fidelity_card.customer_id
    fill_in "Fidelity card", with: @customer_fidelity_card.fidelity_card_id
    fill_in "Status", with: @customer_fidelity_card.status
    fill_in "Uid", with: @customer_fidelity_card.uid
    click_on "Create Customer fidelity card"

    assert_text "Customer fidelity card was successfully created"
    click_on "Back"
  end

  test "updating a Customer fidelity card" do
    visit customer_fidelity_cards_url
    click_on "Edit", match: :first

    fill_in "Account", with: @customer_fidelity_card.account_id
    fill_in "Customer", with: @customer_fidelity_card.customer_id
    fill_in "Fidelity card", with: @customer_fidelity_card.fidelity_card_id
    fill_in "Status", with: @customer_fidelity_card.status
    fill_in "Uid", with: @customer_fidelity_card.uid
    click_on "Update Customer fidelity card"

    assert_text "Customer fidelity card was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer fidelity card" do
    visit customer_fidelity_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer fidelity card was successfully destroyed"
  end
end
