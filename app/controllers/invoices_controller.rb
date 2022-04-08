class InvoicesController < ApplicationController
  
  load_and_authorize_resource :except => [:food, :product, :paynow]
   
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_invoice, only: %i[ show edit update destroy ]

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1 or /invoices/1.json
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

  # GET /invoices/new
  def new
    @customers = Customer.all
    @foods = Food.all
    @products = Product.all
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
    @customers = Customer.all
    @foods = Food.all
    @products = Product.all
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = current_account.invoices.build(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoices_path, notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @invoice }
      else
        @customers = Customer.all
        @foods = Food.all
        @products = Product.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to invoices_path, notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @invoice }
      else
        @customers = Customer.all
        @foods = Food.all
        @products = Product.all
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_cancel
    @invoice = Invoice.find_by(uid: params[:uid])
    
  end

  def post_cancel
    @invoice = Invoice.find_by(uid: params[:uid])
    @invoice.update_column(:status, "Annulée")

    respond_to do |format|
      format.html { redirect_to invoices_url, notice: "Commande annulée avec succès." }
      format.json { head :no_content }
    end
  end

  def paynow
    invoice = Invoice.find_by(uid: params[:uid])
    
    
      payment_method = "Espèce"
    

    respond_to do |format|
      if invoice.update_columns(paid: "Payée", status: "Confirmée", payment_method: payment_method , account_id: current_account.id)

        format.html { redirect_to invoices_path, notice: "Commande payée avec succès." }
        format.json { render :show, status: :created, location: @invoice }
      end
      
    end
  end

  def delete
      @invoice = Invoice.find_by(uid: params[:invoice_id])
  end
  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find_by(uid: params[:uid])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
       params.require(:invoice).permit( :customer_id, invoice_food_items_attributes: [:id,  :food_id, :quantity,  :price, :amount,  :_destroy], invoice_product_items_attributes: [:id,   :product_id, :quantity,  :unit_price, :amount,  :_destroy])
    end
end
