require 'test_helper'

class ProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provider = providers(:one)
  end

  test "should get index" do
    get providers_url
    assert_response :success
  end

  test "should get new" do
    get new_provider_url
    assert_response :success
  end

  test "should create provider" do
    assert_difference('Provider.count') do
      post providers_url, params: { provider: { account_id: @provider.account_id, address: @provider.address, city: @provider.city, civility: @provider.civility, country: @provider.country, description: @provider.description, first_name: @provider.first_name, last_name: @provider.last_name, phone: @provider.phone, po_box: @provider.po_box, status: @provider.status, street: @provider.street, uid: @provider.uid, zip_code: @provider.zip_code } }
    end

    assert_redirected_to provider_url(Provider.last)
  end

  test "should show provider" do
    get provider_url(@provider)
    assert_response :success
  end

  test "should get edit" do
    get edit_provider_url(@provider)
    assert_response :success
  end

  test "should update provider" do
    patch provider_url(@provider), params: { provider: { account_id: @provider.account_id, address: @provider.address, city: @provider.city, civility: @provider.civility, country: @provider.country, description: @provider.description, first_name: @provider.first_name, last_name: @provider.last_name, phone: @provider.phone, po_box: @provider.po_box, status: @provider.status, street: @provider.street, uid: @provider.uid, zip_code: @provider.zip_code } }
    assert_redirected_to provider_url(@provider)
  end

  test "should destroy provider" do
    assert_difference('Provider.count', -1) do
      delete provider_url(@provider)
    end

    assert_redirected_to providers_url
  end
end
