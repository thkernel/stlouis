class QuoteItemsController < ApplicationController
  before_action :set_quote_item, only: %i[ show edit update destroy ]

  # GET /quote_items or /quote_items.json
  def index
    @quote_items = QuoteItem.all
  end

  # GET /quote_items/1 or /quote_items/1.json
  def show
  end

  # GET /quote_items/new
  def new
    @quote_item = QuoteItem.new
  end

  # GET /quote_items/1/edit
  def edit
  end

  # POST /quote_items or /quote_items.json
  def create
    @quote_item = QuoteItem.new(quote_item_params)

    respond_to do |format|
      if @quote_item.save
        format.html { redirect_to quote_item_url(@quote_item), notice: "Quote item was successfully created." }
        format.json { render :show, status: :created, location: @quote_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_items/1 or /quote_items/1.json
  def update
    respond_to do |format|
      if @quote_item.update(quote_item_params)
        format.html { redirect_to quote_item_url(@quote_item), notice: "Quote item was successfully updated." }
        format.json { render :show, status: :ok, location: @quote_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_items/1 or /quote_items/1.json
  def destroy
    @quote_item.destroy

    respond_to do |format|
      format.html { redirect_to quote_items_url, notice: "Quote item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_item
      @quote_item = QuoteItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_item_params
      params.require(:quote_item).permit(:uid)
    end
end
