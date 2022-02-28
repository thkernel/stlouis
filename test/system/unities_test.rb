require "application_system_test_case"

class UnitiesTest < ApplicationSystemTestCase
  setup do
    @unity = unities(:one)
  end

  test "visiting the index" do
    visit unities_url
    assert_selector "h1", text: "Unities"
  end

  test "creating a Unity" do
    visit unities_url
    click_on "New Unity"

    fill_in "Account", with: @unity.account_id
    fill_in "Decription", with: @unity.decription
    fill_in "Name", with: @unity.name
    fill_in "Status", with: @unity.status
    fill_in "Uid", with: @unity.uid
    click_on "Create Unity"

    assert_text "Unity was successfully created"
    click_on "Back"
  end

  test "updating a Unity" do
    visit unities_url
    click_on "Edit", match: :first

    fill_in "Account", with: @unity.account_id
    fill_in "Decription", with: @unity.decription
    fill_in "Name", with: @unity.name
    fill_in "Status", with: @unity.status
    fill_in "Uid", with: @unity.uid
    click_on "Update Unity"

    assert_text "Unity was successfully updated"
    click_on "Back"
  end

  test "destroying a Unity" do
    visit unities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unity was successfully destroyed"
  end
end
