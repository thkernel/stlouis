class RestorationTechnicalSheetItemsController < ApplicationController
  before_action :set_restoration_technical_sheet_item, only: %i[ show edit update destroy ]

  # GET /restoration_technical_sheet_items or /restoration_technical_sheet_items.json
  def index
    @restoration_technical_sheet_items = RestorationTechnicalSheetItem.all
  end

  # GET /restoration_technical_sheet_items/1 or /restoration_technical_sheet_items/1.json
  def show
  end

  # GET /restoration_technical_sheet_items/new
  def new
    @restoration_technical_sheet_item = RestorationTechnicalSheetItem.new
  end

  # GET /restoration_technical_sheet_items/1/edit
  def edit
  end

  # POST /restoration_technical_sheet_items or /restoration_technical_sheet_items.json
  def create
    @restoration_technical_sheet_item = RestorationTechnicalSheetItem.new(restoration_technical_sheet_item_params)

    respond_to do |format|
      if @restoration_technical_sheet_item.save
        format.html { redirect_to restoration_technical_sheet_item_url(@restoration_technical_sheet_item), notice: "Restoration technical sheet item was successfully created." }
        format.json { render :show, status: :created, location: @restoration_technical_sheet_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restoration_technical_sheet_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restoration_technical_sheet_items/1 or /restoration_technical_sheet_items/1.json
  def update
    respond_to do |format|
      if @restoration_technical_sheet_item.update(restoration_technical_sheet_item_params)
        format.html { redirect_to restoration_technical_sheet_item_url(@restoration_technical_sheet_item), notice: "Restoration technical sheet item was successfully updated." }
        format.json { render :show, status: :ok, location: @restoration_technical_sheet_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restoration_technical_sheet_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restoration_technical_sheet_items/1 or /restoration_technical_sheet_items/1.json
  def destroy
    @restoration_technical_sheet_item.destroy

    respond_to do |format|
      format.html { redirect_to restoration_technical_sheet_items_url, notice: "Restoration technical sheet item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restoration_technical_sheet_item
      @restoration_technical_sheet_item = RestorationTechnicalSheetItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restoration_technical_sheet_item_params
      params.require(:restoration_technical_sheet_item).permit(:uid, :restoration_technical_sheet_id, :product_id, :unity_id, :unity_purchase_cost_excl_tax, :quantity, :cost_price_excl_tax)
    end
end
