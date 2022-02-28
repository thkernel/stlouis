require 'test_helper'

class RestorationTechnicalSheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restoration_technical_sheet = restoration_technical_sheets(:one)
  end

  test "should get index" do
    get restoration_technical_sheets_url
    assert_response :success
  end

  test "should get new" do
    get new_restoration_technical_sheet_url
    assert_response :success
  end

  test "should create restoration_technical_sheet" do
    assert_difference('RestorationTechnicalSheet.count') do
      post restoration_technical_sheets_url, params: { restoration_technical_sheet: { account_id: @restoration_technical_sheet.account_id, food_id: @restoration_technical_sheet.food_id, gross_margin: @restoration_technical_sheet.gross_margin, margin_coefficient: @restoration_technical_sheet.margin_coefficient, margin_rate: @restoration_technical_sheet.margin_rate, portion_number: @restoration_technical_sheet.portion_number, produced_portion_unit_cost_price_excl_tax: @restoration_technical_sheet.produced_portion_unit_cost_price_excl_tax, sale_price_incl_vat: @restoration_technical_sheet.sale_price_incl_vat, selling_price_excl_tax: @restoration_technical_sheet.selling_price_excl_tax, sold_portion_unit_cost_price_excl_vat: @restoration_technical_sheet.sold_portion_unit_cost_price_excl_vat, status: @restoration_technical_sheet.status, total_cost_price_excl_tax: @restoration_technical_sheet.total_cost_price_excl_tax, uid: @restoration_technical_sheet.uid, unsold_average_percentage: @restoration_technical_sheet.unsold_average_percentage, vat_rate: @restoration_technical_sheet.vat_rate } }
    end

    assert_redirected_to restoration_technical_sheet_url(RestorationTechnicalSheet.last)
  end

  test "should show restoration_technical_sheet" do
    get restoration_technical_sheet_url(@restoration_technical_sheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_restoration_technical_sheet_url(@restoration_technical_sheet)
    assert_response :success
  end

  test "should update restoration_technical_sheet" do
    patch restoration_technical_sheet_url(@restoration_technical_sheet), params: { restoration_technical_sheet: { account_id: @restoration_technical_sheet.account_id, food_id: @restoration_technical_sheet.food_id, gross_margin: @restoration_technical_sheet.gross_margin, margin_coefficient: @restoration_technical_sheet.margin_coefficient, margin_rate: @restoration_technical_sheet.margin_rate, portion_number: @restoration_technical_sheet.portion_number, produced_portion_unit_cost_price_excl_tax: @restoration_technical_sheet.produced_portion_unit_cost_price_excl_tax, sale_price_incl_vat: @restoration_technical_sheet.sale_price_incl_vat, selling_price_excl_tax: @restoration_technical_sheet.selling_price_excl_tax, sold_portion_unit_cost_price_excl_vat: @restoration_technical_sheet.sold_portion_unit_cost_price_excl_vat, status: @restoration_technical_sheet.status, total_cost_price_excl_tax: @restoration_technical_sheet.total_cost_price_excl_tax, uid: @restoration_technical_sheet.uid, unsold_average_percentage: @restoration_technical_sheet.unsold_average_percentage, vat_rate: @restoration_technical_sheet.vat_rate } }
    assert_redirected_to restoration_technical_sheet_url(@restoration_technical_sheet)
  end

  test "should destroy restoration_technical_sheet" do
    assert_difference('RestorationTechnicalSheet.count', -1) do
      delete restoration_technical_sheet_url(@restoration_technical_sheet)
    end

    assert_redirected_to restoration_technical_sheets_url
  end
end
