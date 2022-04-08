class QuoteProductItemsController < ApplicationController
  before_action :set_quote_product_item, only: %i[ show edit update destroy ]

  # GET /quote_product_items or /quote_product_items.json
  def index
    @quote_product_items = QuoteProductItem.all
  end

  # GET /quote_product_items/1 or /quote_product_items/1.json
  def show
  end

  # GET /quote_product_items/new
  def new
    @quote_product_item = QuoteProductItem.new
  end

  # GET /quote_product_items/1/edit
  def edit
  end

  # POST /quote_product_items or /quote_product_items.json
  def create
    @quote_product_item = QuoteProductItem.new(quote_product_item_params)

    respond_to do |format|
      if @quote_product_item.save
        format.html { redirect_to quote_product_item_url(@quote_product_item), notice: "Quote product item was successfully created." }
        format.json { render :show, status: :created, location: @quote_product_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote_product_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_product_items/1 or /quote_product_items/1.json
  def update
    respond_to do |format|
      if @quote_product_item.update(quote_product_item_params)
        format.html { redirect_to quote_product_item_url(@quote_product_item), notice: "Quote product item was successfully updated." }
        format.json { render :show, status: :ok, location: @quote_product_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote_product_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_product_items/1 or /quote_product_items/1.json
  def destroy
    @quote_product_item.destroy

    respond_to do |format|
      format.html { redirect_to quote_product_items_url, notice: "Quote product item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_product_item
      @quote_product_item = QuoteProductItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_product_item_params
      params.require(:quote_product_item).permit(:uid)
    end
end
