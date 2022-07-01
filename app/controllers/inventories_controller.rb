class InventoriesController < ApplicationController
  #authorize_resource, except: :food
   load_and_authorize_resource :except => [:food, :product, :paynow, :get_cancel, :post_cancel]
   
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_inventory, only: %i[ show edit update destroy ]

  # GET /inventories or /inventories.json
  def index
    @inventories = Inventory.all
  end

  # GET /inventories/1 or /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @products = Product.all
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
    @products = Product.all
  end

  # POST /inventories or /inventories.json
  def create
    @inventory = current_account.inventories.build(inventory_params)

    respond_to do |format|
      if @inventory.save
        @inventories = Inventory.all
        format.html { redirect_to inventory_url(@inventory), notice: "Inventory was successfully created." }
        format.json { render :show, status: :created, location: @inventory }
        format.js
      else
        @products = Product.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /inventories/1 or /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventory_url(@inventory), notice: "Inventory was successfully updated." }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: "Inventory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_params
      params.require(:inventory).permit(:inventory_date, :product_id, :current_stock, :real_stock)
    end
end
