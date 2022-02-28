require "application_system_test_case"

class RestorationTechnicalSheetsTest < ApplicationSystemTestCase
  setup do
    @restoration_technical_sheet = restoration_technical_sheets(:one)
  end

  test "visiting the index" do
    visit restoration_technical_sheets_url
    assert_selector "h1", text: "Restoration Technical Sheets"
  end

  test "creating a Restoration technical sheet" do
    visit restoration_technical_sheets_url
    click_on "New Restoration Technical Sheet"

    fill_in "Account", with: @restoration_technical_sheet.account_id
    fill_in "Food", with: @restoration_technical_sheet.food_id
    fill_in "Gross margin", with: @restoration_technical_sheet.gross_margin
    fill_in "Margin coefficient", with: @restoration_technical_sheet.margin_coefficient
    fill_in "Margin rate", with: @restoration_technical_sheet.margin_rate
    fill_in "Portion number", with: @restoration_technical_sheet.portion_number
    fill_in "Produced portion unit cost price excl tax", with: @restoration_technical_sheet.produced_portion_unit_cost_price_excl_tax
    fill_in "Sale price incl vat", with: @restoration_technical_sheet.sale_price_incl_vat
    fill_in "Selling price excl tax", with: @restoration_technical_sheet.selling_price_excl_tax
    fill_in "Sold portion unit cost price excl vat", with: @restoration_technical_sheet.sold_portion_unit_cost_price_excl_vat
    fill_in "Status", with: @restoration_technical_sheet.status
    fill_in "Total cost price excl tax", with: @restoration_technical_sheet.total_cost_price_excl_tax
    fill_in "Uid", with: @restoration_technical_sheet.uid
    fill_in "Unsold average percentage", with: @restoration_technical_sheet.unsold_average_percentage
    fill_in "Vat rate", with: @restoration_technical_sheet.vat_rate
    click_on "Create Restoration technical sheet"

    assert_text "Restoration technical sheet was successfully created"
    click_on "Back"
  end

  test "updating a Restoration technical sheet" do
    visit restoration_technical_sheets_url
    click_on "Edit", match: :first

    fill_in "Account", with: @restoration_technical_sheet.account_id
    fill_in "Food", with: @restoration_technical_sheet.food_id
    fill_in "Gross margin", with: @restoration_technical_sheet.gross_margin
    fill_in "Margin coefficient", with: @restoration_technical_sheet.margin_coefficient
    fill_in "Margin rate", with: @restoration_technical_sheet.margin_rate
    fill_in "Portion number", with: @restoration_technical_sheet.portion_number
    fill_in "Produced portion unit cost price excl tax", with: @restoration_technical_sheet.produced_portion_unit_cost_price_excl_tax
    fill_in "Sale price incl vat", with: @restoration_technical_sheet.sale_price_incl_vat
    fill_in "Selling price excl tax", with: @restoration_technical_sheet.selling_price_excl_tax
    fill_in "Sold portion unit cost price excl vat", with: @restoration_technical_sheet.sold_portion_unit_cost_price_excl_vat
    fill_in "Status", with: @restoration_technical_sheet.status
    fill_in "Total cost price excl tax", with: @restoration_technical_sheet.total_cost_price_excl_tax
    fill_in "Uid", with: @restoration_technical_sheet.uid
    fill_in "Unsold average percentage", with: @restoration_technical_sheet.unsold_average_percentage
    fill_in "Vat rate", with: @restoration_technical_sheet.vat_rate
    click_on "Update Restoration technical sheet"

    assert_text "Restoration technical sheet was successfully updated"
    click_on "Back"
  end

  test "destroying a Restoration technical sheet" do
    visit restoration_technical_sheets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restoration technical sheet was successfully destroyed"
  end
end
