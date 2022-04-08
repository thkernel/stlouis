class InvoiceFoodItemsController < ApplicationController
  before_action :set_invoice_food_item, only: %i[ show edit update destroy ]

  # GET /invoice_food_items or /invoice_food_items.json
  def index
    @invoice_food_items = InvoiceFoodItem.all
  end

  # GET /invoice_food_items/1 or /invoice_food_items/1.json
  def show
  end

  # GET /invoice_food_items/new
  def new
    @invoice_food_item = InvoiceFoodItem.new
  end

  # GET /invoice_food_items/1/edit
  def edit
  end

  # POST /invoice_food_items or /invoice_food_items.json
  def create
    @invoice_food_item = InvoiceFoodItem.new(invoice_food_item_params)

    respond_to do |format|
      if @invoice_food_item.save
        format.html { redirect_to invoice_food_item_url(@invoice_food_item), notice: "Invoice food item was successfully created." }
        format.json { render :show, status: :created, location: @invoice_food_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice_food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_food_items/1 or /invoice_food_items/1.json
  def update
    respond_to do |format|
      if @invoice_food_item.update(invoice_food_item_params)
        format.html { redirect_to invoice_food_item_url(@invoice_food_item), notice: "Invoice food item was successfully updated." }
        format.json { render :show, status: :ok, location: @invoice_food_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice_food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_food_items/1 or /invoice_food_items/1.json
  def destroy
    @invoice_food_item.destroy

    respond_to do |format|
      format.html { redirect_to invoice_food_items_url, notice: "Invoice food item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_food_item
      @invoice_food_item = InvoiceFoodItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_food_item_params
      params.require(:invoice_food_item).permit(:uid)
    end
end
