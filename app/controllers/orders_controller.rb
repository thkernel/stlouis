class OrdersController < ApplicationController
   #authorize_resource, except: :food
   load_and_authorize_resource :except => [:food, :product, :paynow]
   
  before_action :authenticate_account!
  layout "dashboard"

  #before_action :set_order, only: %i[ show edit update destroy generate_pdf ]
  before_action :set_order, only: [:show, :edit, :update,:generate_pdf, :destroy]
 
  # GET /orders or /orders.json
  def index

    if current_account.superuser? || current_account.admin? || current_account.superviseur? || current_account.gerant?

      @orders = Order.all
    elsif current_account.client?
      puts "CUSTOMER: #{current_account.accountable.inspect}"
      @orders = Order.where(customer_id: current_account.accountable.id)
    else
      @orders = current_account.orders
    end
  end

  # GET /orders/1 or /orders/1.json
  def show
    #render layout: "pdf"
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


  # GET /orders/new
  def new
    @customers = Customer.all
    @tables = Table.all
    @foods = Food.all
    @products = Product.all
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @customers = Customer.all
    @foods = Food.all
    @products = Product.all
    @tables = Table.all
  end

  def scan_card
  end

  #For PDF
  def generate_pdf

    puts "REQUESTS: #{@order}"
    respond_to do |format|
        format.html
        format.pdf do
            render :pdf => "commande-#{@order.uid}-#{Time.now}", 
            layout: 'pdf',
            page_size: 'A4',
            template: "orders/pdf.html.erb",
            lowquality: true,
            zoom: 1,
            dpi: 75
        end
    end

    #render layout: "pdf"
  end

def complete_order
   
    @order = current_account.orders.build 
    cart_items = @shopping_cart.cart_items                    
   
    if cart_items.present?
  
      cart_items.each do |cart_item|
        @order.order_items.build(food_id: cart_item.food_id, price: Food.find(cart_item.food_id).price, quantity: cart_item.quantity)
      end
   
      puts "ORDER: #{@order.inspect}"
      respond_to do |format|
        if @order.save
          
          @shopping_cart.destroy
          session.delete(:shopping_cart)
          
          format.html { redirect_to order_complete_success_path, notice: 'Commande envoyée avec succès.' }
          format.json { render :show, status: :ok, location: @order }
        else
          puts "ORDER: #{@order.inspect}"
          format.html { render :order_complete_error}
        
          #redirect_to order_complete_error_path
          
        end
      end
    end
    
  end

  def order_complete_success
    render layout: "front"
  end
  def order_complete_error
    
    render layout: "front"
  end
  def paynow
    order = Order.find_by(uid: params[:uid])
    
    if order.social_case == true
      payment_method = "Gratuite"
    else
      payment_method = "Espèce"
    end

    respond_to do |format|
      if order.update_columns(paid: "Payée", status: "Confirmée", payment_method: payment_method , account_id: current_account.id)

        format.html { redirect_to orders_path, notice: "Commande payée avec succès." }
        format.json { render :show, status: :created, location: @order }
      end
      
    end
  end
  

  # POST /orders or /orders.json
  def create
    @order = current_account.orders.build(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to show_order_path(uid: @order.uid), notice: "Commande créee avec succès." }
        format.json { render :show, status: :created, location: @order }
      else
        @customers = Customer.all
        @tables = Table.all
        @foods = Food.all
        @products = Product.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  def get_cancel
    @order = Order.find_by(uid: params[:uid])
    
  end

  def post_cancel
    @order = Order.find_by(uid: params[:uid])
    @order.update_column(:status, "Annulée")

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Commande annulée avec succès." }
      format.json { head :no_content }
    end
  end

  def delete
      @order = Order.find_by(uid: params[:order_id])
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find_by(uid: params[:uid])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:uid, :customer_id, :table_id, :vip_space, order_items_attributes: [:id,  :food_id, :product_id, :quantity, :discount, :price, :amount,  :_destroy], order_item_drinks_attributes: [:id,   :product_id, :quantity,  :unit_price, :amount,  :_destroy])
     
    end
end
