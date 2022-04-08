require 'test_helper'

class InvoiceProduitItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_produit_item = invoice_produit_items(:one)
  end

  test "should get index" do
    get invoice_produit_items_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_produit_item_url
    assert_response :success
  end

  test "should create invoice_produit_item" do
    assert_difference('InvoiceProduitItem.count') do
      post invoice_produit_items_url, params: { invoice_produit_item: { uid: @invoice_produit_item.uid } }
    end

    assert_redirected_to invoice_produit_item_url(InvoiceProduitItem.last)
  end

  test "should show invoice_produit_item" do
    get invoice_produit_item_url(@invoice_produit_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_produit_item_url(@invoice_produit_item)
    assert_response :success
  end

  test "should update invoice_produit_item" do
    patch invoice_produit_item_url(@invoice_produit_item), params: { invoice_produit_item: { uid: @invoice_produit_item.uid } }
    assert_redirected_to invoice_produit_item_url(@invoice_produit_item)
  end

  test "should destroy invoice_produit_item" do
    assert_difference('InvoiceProduitItem.count', -1) do
      delete invoice_produit_item_url(@invoice_produit_item)
    end

    assert_redirected_to invoice_produit_items_url
  end
end
