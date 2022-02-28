class ProductsController < ApplicationController
   #authorize_resource
   load_and_authorize_resource :except => [:delete]
   
  before_action :authenticate_account!
  layout "dashboard"
  
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product_categories = ProductCategory.all
    @unities = Unity.all
    @providers = Provider.all
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product_categories = ProductCategory.all
    @providers = Provider.all
    @unities = Unity.all
  end

  # POST /products or /products.json
  def create
    @product = current_account.products.build(product_params)

    respond_to do |format|
      if @product.save
        @products = Product.all

        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
         @products = Product.all
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @product = Product.find_by(uid: params[:product_id])
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:product_category_id, :name, :bar_code, :unit_price, :provider_id, :reorder_threshold, :unity_id, :description,  :status)
    end
end
