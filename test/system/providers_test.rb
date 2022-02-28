require "application_system_test_case"

class ProvidersTest < ApplicationSystemTestCase
  setup do
    @provider = providers(:one)
  end

  test "visiting the index" do
    visit providers_url
    assert_selector "h1", text: "Providers"
  end

  test "creating a Provider" do
    visit providers_url
    click_on "New Provider"

    fill_in "Account", with: @provider.account_id
    fill_in "Address", with: @provider.address
    fill_in "City", with: @provider.city
    fill_in "Civility", with: @provider.civility
    fill_in "Country", with: @provider.country
    fill_in "Description", with: @provider.description
    fill_in "First name", with: @provider.first_name
    fill_in "Last name", with: @provider.last_name
    fill_in "Phone", with: @provider.phone
    fill_in "Po box", with: @provider.po_box
    fill_in "Status", with: @provider.status
    fill_in "Street", with: @provider.street
    fill_in "Uid", with: @provider.uid
    fill_in "Zip code", with: @provider.zip_code
    click_on "Create Provider"

    assert_text "Provider was successfully created"
    click_on "Back"
  end

  test "updating a Provider" do
    visit providers_url
    click_on "Edit", match: :first

    fill_in "Account", with: @provider.account_id
    fill_in "Address", with: @provider.address
    fill_in "City", with: @provider.city
    fill_in "Civility", with: @provider.civility
    fill_in "Country", with: @provider.country
    fill_in "Description", with: @provider.description
    fill_in "First name", with: @provider.first_name
    fill_in "Last name", with: @provider.last_name
    fill_in "Phone", with: @provider.phone
    fill_in "Po box", with: @provider.po_box
    fill_in "Status", with: @provider.status
    fill_in "Street", with: @provider.street
    fill_in "Uid", with: @provider.uid
    fill_in "Zip code", with: @provider.zip_code
    click_on "Update Provider"

    assert_text "Provider was successfully updated"
    click_on "Back"
  end

  test "destroying a Provider" do
    visit providers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Provider was successfully destroyed"
  end
end
