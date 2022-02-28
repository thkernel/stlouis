class TechnicalSheetsController < ApplicationController
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_technical_sheet, only: %i[ show edit update destroy ]

  # GET /rtechnical_sheets or /technical_sheets.json
  def index
    @technical_sheets = TechnicalSheet.all
  end

  # GET /technical_sheets/1 or /technical_sheets/1.json
  def show
  end

  # GET /technical_sheets/new
  def new
    @foods = Food.all
    @products = Product.all
    @unities = Unity.all
    @technical_sheet = TechnicalSheet.new
  end

  # GET /technical_sheets/1/edit
  def edit
    @foods = Food.all
    @products = Product.all
    @unities = Unity.all
  end

  # POST /technical_sheets or /technical_sheets.json
  def create
    @technical_sheet = current_account.technical_sheets.build(technical_sheet_params)

    respond_to do |format|
      if @technical_sheet.save
        format.html { redirect_to technical_sheets_path, notice: "Technical sheet was successfully created." }
        format.json { render :show, status: :created, location: @technical_sheet }
      else
          @foods = Food.all
          @products = Product.all
          @unities = Unity.all

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @technical_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /technical_sheets/1 or /technical_sheets/1.json
  def update
    respond_to do |format|
      if @technical_sheet.update(technical_sheet_params)
        format.html { redirect_to technical_sheet_url(@technical_sheet), notice: "Technical sheet was successfully updated." }
        format.json { render :show, status: :ok, location: @restoration_technical_sheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @technical_sheet.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @technical_sheet = TechnicalSheet.find_by(uid: params[:technical_sheet_id])
  end


  # DELETE /technical_sheets/1 or /technical_sheets/1.json
  def destroy
    @technical_sheet.destroy

    respond_to do |format|
      format.html { redirect_to technical_sheets_url, notice: "Technical sheet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technical_sheet
      @technical_sheet = TechnicalSheet.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def technical_sheet_params
      params.require(:technical_sheet).permit(:food_id, :portion_number, :sale_price_incl_vat, :vat_rate, :total_cost_price_excl_tax, :produced_portion_unit_cost_price_excl_tax, :unsold_average_percentage, :sold_portion_unit_cost_price_excl_vat, :selling_price_excl_tax, :gross_margin, :margin_rate, :margin_coefficient, technical_sheet_items_attributes: [:id,  :product_id, :unity_id, :unity_purchase_cost_excl_tax, :quantity, :cost_price_excl_tax,  :_destroy])
    end
end
