class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  def add_to_cart
    food = Food.find_by(uid: params[:food])
  
  puts "FOOD: #{food.inspect}"
    
    @cart_item = CartItem.new
    
    @cart_item.food_id = food.id

    if params[:quantity].present?
      @cart_item.quantity = params[:quantity]
    else
      @cart_item.quantity = 1 
    end

    @shopping_cart.add_food(@cart_item)

    
    respond_to do |format|
      if @shopping_cart.save
        
        format.html { redirect_to @cart_item, notice: 'Plat ajouté au panier avec succès.' }
        format.json { render :show, status: :created, location: @cart_item }
        format.js {flash.now[:notice] = 'Plat ajouté au panier avec succès.'}
      else
        format.html { render :new }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /cart_items
  # POST /cart_items.json
  def create
    @cart_item = CartItem.new(cart_item_params)
    @shopping_cart.add_food(@cart_item)
    respond_to do |format|
      if @shopping_cart.save
        
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully created.' }
        format.json { render :show, status: :created, location: @cart_item }
        format.js
      else
        format.html { render :new }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @cart_item = CartItem.find(params[:cart_item_id])
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to show_cart_path, notice: 'Cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:uid, :cart_id, :product_id, :quantity, :status)
    end
end
