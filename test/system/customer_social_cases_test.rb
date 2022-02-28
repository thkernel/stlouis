require "application_system_test_case"

class CustomerSocialCasesTest < ApplicationSystemTestCase
  setup do
    @customer_social_case = customer_social_cases(:one)
  end

  test "visiting the index" do
    visit customer_social_cases_url
    assert_selector "h1", text: "Customer Social Cases"
  end

  test "creating a Customer social case" do
    visit customer_social_cases_url
    click_on "New Customer Social Case"

    fill_in "Account", with: @customer_social_case.account_id
    fill_in "Customer", with: @customer_social_case.customer_id
    fill_in "Dish number", with: @customer_social_case.dish_number
    fill_in "Status", with: @customer_social_case.status
    fill_in "Time unit", with: @customer_social_case.time_unit_id
    fill_in "Uid", with: @customer_social_case.uid
    click_on "Create Customer social case"

    assert_text "Customer social case was successfully created"
    click_on "Back"
  end

  test "updating a Customer social case" do
    visit customer_social_cases_url
    click_on "Edit", match: :first

    fill_in "Account", with: @customer_social_case.account_id
    fill_in "Customer", with: @customer_social_case.customer_id
    fill_in "Dish number", with: @customer_social_case.dish_number
    fill_in "Status", with: @customer_social_case.status
    fill_in "Time unit", with: @customer_social_case.time_unit_id
    fill_in "Uid", with: @customer_social_case.uid
    click_on "Update Customer social case"

    assert_text "Customer social case was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer social case" do
    visit customer_social_cases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer social case was successfully destroyed"
  end
end
