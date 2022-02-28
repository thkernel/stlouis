require 'test_helper'

class CustomerSocialCasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_social_case = customer_social_cases(:one)
  end

  test "should get index" do
    get customer_social_cases_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_social_case_url
    assert_response :success
  end

  test "should create customer_social_case" do
    assert_difference('CustomerSocialCase.count') do
      post customer_social_cases_url, params: { customer_social_case: { account_id: @customer_social_case.account_id, customer_id: @customer_social_case.customer_id, dish_number: @customer_social_case.dish_number, status: @customer_social_case.status, time_unit_id: @customer_social_case.time_unit_id, uid: @customer_social_case.uid } }
    end

    assert_redirected_to customer_social_case_url(CustomerSocialCase.last)
  end

  test "should show customer_social_case" do
    get customer_social_case_url(@customer_social_case)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_social_case_url(@customer_social_case)
    assert_response :success
  end

  test "should update customer_social_case" do
    patch customer_social_case_url(@customer_social_case), params: { customer_social_case: { account_id: @customer_social_case.account_id, customer_id: @customer_social_case.customer_id, dish_number: @customer_social_case.dish_number, status: @customer_social_case.status, time_unit_id: @customer_social_case.time_unit_id, uid: @customer_social_case.uid } }
    assert_redirected_to customer_social_case_url(@customer_social_case)
  end

  test "should destroy customer_social_case" do
    assert_difference('CustomerSocialCase.count', -1) do
      delete customer_social_case_url(@customer_social_case)
    end

    assert_redirected_to customer_social_cases_url
  end
end
