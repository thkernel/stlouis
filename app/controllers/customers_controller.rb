class CustomersController < ApplicationController
   #authorize_resource
   load_and_authorize_resource :except => [:delete]
   
  before_action :authenticate_account!
  layout "dashboard"
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = current_account.customers.build(customer_params)

    respond_to do |format|
      if @customer.save
        @customers = Customer.all
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        @customers = Customer.all

        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @customer = Customer.find_by(uid: params[:customer_id])
    end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:company_name, :first_name, :last_name, :civility, :address, :country, :city, :phone, :street, :email, :po_box, :zip_code, :description, :status)
    end
end
