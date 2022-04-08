class QuotesController < ApplicationController
  
  load_and_authorize_resource :except => [:food, :product, :paynow]
   
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_quote, only: %i[ show edit update destroy ]

  # GET /quotes or /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1 or /quotes/1.json
  def show
  end

  def food 
      data = params[:data]
      customer_id = params[:customer_id]
    
      puts "ID: #{data}"

      food = Food.find(data)

      customer_discount = CustomerDiscount.find_by(customer_id: customer_id) 
      
      puts "FOOD: #{food}"
      data = {:data => food, :customer_discount  => customer_discount}
      render :json => data
    
  end

  def product 
      data = params[:data]
    
      puts "ID: #{data}"
      product = Product.find(data)
      puts "Product: #{product.inspect}"
      data = {:data => product}
      render :json => data
    
  end

  # GET /quotes/new
  def new
    @customers = Customer.all
    @foods = Food.all
    @products = Product.all
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
    @customers = Customer.all
    @foods = Food.all
    @products = Product.all
  end

  # POST /quotes or /quotes.json
  def create
    @quote = current_account.quotes.build(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        @customers = Customer.all
        @foods = Food.all
        @products = Product.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        @customers = Customer.all
        @foods = Food.all
        @products = Product.all
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_cancel
    @quote = quote.find_by(uid: params[:uid])
    
  end

  def post_cancel
    @quote = quote.find_by(uid: params[:uid])
    @quote.update_column(:status, "Annulée")

    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Commande annulée avec succès." }
      format.json { head :no_content }
    end
  end

  def delete
      @quote = quote.find_by(uid: params[:quote_id])
  end
  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find_by(uid: params[:uid])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
       params.require(:quote).permit( :customer_id, quote_food_items_attributes: [:id,  :food_id, :quantity,  :price, :amount,  :_destroy], quote_product_items_attributes: [:id,   :product_id, :quantity,  :unit_price, :amount,  :_destroy])
    end
end
