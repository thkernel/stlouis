class InvoiceProduitItemsController < ApplicationController
  before_action :set_invoice_produit_item, only: %i[ show edit update destroy ]

  # GET /invoice_produit_items or /invoice_produit_items.json
  def index
    @invoice_produit_items = InvoiceProduitItem.all
  end

  # GET /invoice_produit_items/1 or /invoice_produit_items/1.json
  def show
  end

  # GET /invoice_produit_items/new
  def new
    @invoice_produit_item = InvoiceProduitItem.new
  end

  # GET /invoice_produit_items/1/edit
  def edit
  end

  # POST /invoice_produit_items or /invoice_produit_items.json
  def create
    @invoice_produit_item = InvoiceProduitItem.new(invoice_produit_item_params)

    respond_to do |format|
      if @invoice_produit_item.save
        format.html { redirect_to invoice_produit_item_url(@invoice_produit_item), notice: "Invoice produit item was successfully created." }
        format.json { render :show, status: :created, location: @invoice_produit_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice_produit_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_produit_items/1 or /invoice_produit_items/1.json
  def update
    respond_to do |format|
      if @invoice_produit_item.update(invoice_produit_item_params)
        format.html { redirect_to invoice_produit_item_url(@invoice_produit_item), notice: "Invoice produit item was successfully updated." }
        format.json { render :show, status: :ok, location: @invoice_produit_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice_produit_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_produit_items/1 or /invoice_produit_items/1.json
  def destroy
    @invoice_produit_item.destroy

    respond_to do |format|
      format.html { redirect_to invoice_produit_items_url, notice: "Invoice produit item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_produit_item
      @invoice_produit_item = InvoiceProduitItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_produit_item_params
      params.require(:invoice_produit_item).permit(:uid)
    end
end
