class CustomerDiscountsController < ApplicationController
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_customer_discount, only: %i[ show edit update destroy ]

  # GET /customer_discounts or /customer_discounts.json
  def index
    @customer_discounts = CustomerDiscount.all
  end

  # GET /customer_discounts/1 or /customer_discounts/1.json
  def show
  end

  # GET /customer_discounts/new
  def new
    @customers = Customer.all
    @customer_discount = CustomerDiscount.new
  end

  # GET /customer_discounts/1/edit
  def edit
    @customers = Customer.all
  end

  # POST /customer_discounts or /customer_discounts.json
  def create
    @customer_discount = current_account.customer_discounts.build(customer_discount_params)

    respond_to do |format|
      if @customer_discount.save
        @customers = Customer.all
        @customer_discounts = CustomerDiscount.all
        format.html { redirect_to customer_discount_url(@customer_discount), notice: "Customer discount was successfully created." }
        format.json { render :show, status: :created, location: @customer_discount }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_discount.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /customer_discounts/1 or /customer_discounts/1.json
  def update
    respond_to do |format|
      if @customer_discount.update(customer_discount_params)
        @customers = Customer.all
        @customer_discounts = CustomerDiscount.all
        format.html { redirect_to customer_discount_url(@customer_discount), notice: "Customer discount was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_discount }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_discount.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
      @customer_discount = CustomerDiscount.find_by(uid: params[:customer_discount_id])
    end

  # DELETE /customer_discounts/1 or /customer_discounts/1.json
  def destroy
    @customer_discount.destroy

    respond_to do |format|
      format.html { redirect_to customer_discounts_url, notice: "Customer discount was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_discount
      @customer_discount = CustomerDiscount.find_by(uid: params[:uid])
    end

    # Only allow a list of trusted parameters through.
    def customer_discount_params
      params.require(:customer_discount).permit(:customer_id, :amount)
    end
end
