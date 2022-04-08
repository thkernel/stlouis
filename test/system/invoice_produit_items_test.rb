require "application_system_test_case"

class InvoiceProduitItemsTest < ApplicationSystemTestCase
  setup do
    @invoice_produit_item = invoice_produit_items(:one)
  end

  test "visiting the index" do
    visit invoice_produit_items_url
    assert_selector "h1", text: "Invoice Produit Items"
  end

  test "creating a Invoice produit item" do
    visit invoice_produit_items_url
    click_on "New Invoice Produit Item"

    fill_in "Uid", with: @invoice_produit_item.uid
    click_on "Create Invoice produit item"

    assert_text "Invoice produit item was successfully created"
    click_on "Back"
  end

  test "updating a Invoice produit item" do
    visit invoice_produit_items_url
    click_on "Edit", match: :first

    fill_in "Uid", with: @invoice_produit_item.uid
    click_on "Update Invoice produit item"

    assert_text "Invoice produit item was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice produit item" do
    visit invoice_produit_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice produit item was successfully destroyed"
  end
end
