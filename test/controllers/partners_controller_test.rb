require 'test_helper'

class PartnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partner = partners(:one)
  end

  test "should get index" do
    get partners_url
    assert_response :success
  end

  test "should get new" do
    get new_partner_url
    assert_response :success
  end

  test "should create partner" do
    assert_difference('Partner.count') do
      post partners_url, params: { partner: { account_id: @partner.account_id, address: @partner.address, city: @partner.city, civility: @partner.civility, company_name: @partner.company_name, country: @partner.country, description: @partner.description, email: @partner.email, first_name: @partner.first_name, last_name: @partner.last_name, phone: @partner.phone, status: @partner.status, uid: @partner.uid } }
    end

    assert_redirected_to partner_url(Partner.last)
  end

  test "should show partner" do
    get partner_url(@partner)
    assert_response :success
  end

  test "should get edit" do
    get edit_partner_url(@partner)
    assert_response :success
  end

  test "should update partner" do
    patch partner_url(@partner), params: { partner: { account_id: @partner.account_id, address: @partner.address, city: @partner.city, civility: @partner.civility, company_name: @partner.company_name, country: @partner.country, description: @partner.description, email: @partner.email, first_name: @partner.first_name, last_name: @partner.last_name, phone: @partner.phone, status: @partner.status, uid: @partner.uid } }
    assert_redirected_to partner_url(@partner)
  end

  test "should destroy partner" do
    assert_difference('Partner.count', -1) do
      delete partner_url(@partner)
    end

    assert_redirected_to partners_url
  end
end
