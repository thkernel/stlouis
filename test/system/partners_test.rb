require "application_system_test_case"

class PartnersTest < ApplicationSystemTestCase
  setup do
    @partner = partners(:one)
  end

  test "visiting the index" do
    visit partners_url
    assert_selector "h1", text: "Partners"
  end

  test "creating a Partner" do
    visit partners_url
    click_on "New Partner"

    fill_in "Account", with: @partner.account_id
    fill_in "Address", with: @partner.address
    fill_in "City", with: @partner.city
    fill_in "Civility", with: @partner.civility
    fill_in "Company name", with: @partner.company_name
    fill_in "Country", with: @partner.country
    fill_in "Description", with: @partner.description
    fill_in "Email", with: @partner.email
    fill_in "First name", with: @partner.first_name
    fill_in "Last name", with: @partner.last_name
    fill_in "Phone", with: @partner.phone
    fill_in "Status", with: @partner.status
    fill_in "Uid", with: @partner.uid
    click_on "Create Partner"

    assert_text "Partner was successfully created"
    click_on "Back"
  end

  test "updating a Partner" do
    visit partners_url
    click_on "Edit", match: :first

    fill_in "Account", with: @partner.account_id
    fill_in "Address", with: @partner.address
    fill_in "City", with: @partner.city
    fill_in "Civility", with: @partner.civility
    fill_in "Company name", with: @partner.company_name
    fill_in "Country", with: @partner.country
    fill_in "Description", with: @partner.description
    fill_in "Email", with: @partner.email
    fill_in "First name", with: @partner.first_name
    fill_in "Last name", with: @partner.last_name
    fill_in "Phone", with: @partner.phone
    fill_in "Status", with: @partner.status
    fill_in "Uid", with: @partner.uid
    click_on "Update Partner"

    assert_text "Partner was successfully updated"
    click_on "Back"
  end

  test "destroying a Partner" do
    visit partners_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Partner was successfully destroyed"
  end
end
