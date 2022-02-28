class OrderItemDrinksController < ApplicationController
  before_action :set_order_item_drink, only: %i[ show edit update destroy ]

  # GET /order_item_drinks or /order_item_drinks.json
  def index
    @order_item_drinks = OrderItemDrink.all
  end

  # GET /order_item_drinks/1 or /order_item_drinks/1.json
  def show
  end

  # GET /order_item_drinks/new
  def new
    @order_item_drink = OrderItemDrink.new
  end

  # GET /order_item_drinks/1/edit
  def edit
  end

  # POST /order_item_drinks or /order_item_drinks.json
  def create
    @order_item_drink = OrderItemDrink.new(order_item_drink_params)

    respond_to do |format|
      if @order_item_drink.save
        format.html { redirect_to order_item_drink_url(@order_item_drink), notice: "Order item drink was successfully created." }
        format.json { render :show, status: :created, location: @order_item_drink }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item_drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_item_drinks/1 or /order_item_drinks/1.json
  def update
    respond_to do |format|
      if @order_item_drink.update(order_item_drink_params)
        format.html { redirect_to order_item_drink_url(@order_item_drink), notice: "Order item drink was successfully updated." }
        format.json { render :show, status: :ok, location: @order_item_drink }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_item_drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_item_drinks/1 or /order_item_drinks/1.json
  def destroy
    @order_item_drink.destroy

    respond_to do |format|
      format.html { redirect_to order_item_drinks_url, notice: "Order item drink was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item_drink
      @order_item_drink = OrderItemDrink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_drink_params
      params.require(:order_item_drink).permit(:order_id, :product_id, :quantity, :unit_price, :amount)
    end
end
