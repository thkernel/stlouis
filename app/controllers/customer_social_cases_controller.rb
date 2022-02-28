class CustomerSocialCasesController < ApplicationController
  
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_customer_social_case, only: %i[ show edit update destroy ]

  # GET /customer_social_cases or /customer_social_cases.json
  def index
    @customer_social_cases = CustomerSocialCase.all
  end

  # GET /customer_social_cases/1 or /customer_social_cases/1.json
  def show
  end

  # GET /customer_social_cases/new
  def new
    @customers = Customer.all
    @time_units = TimeUnit.all
    @customer_social_case = CustomerSocialCase.new
  end

  # GET /customer_social_cases/1/edit
  def edit
    @customers = Customer.all
    @time_units = TimeUnit.all
  end

  # POST /customer_social_cases or /customer_social_cases.json
  def create
    @customer_social_case = current_account.customer_social_cases.build(customer_social_case_params)

    respond_to do |format|
      if @customer_social_case.save

        @customer_social_cases = CustomerSocialCase.all


        format.html { redirect_to customer_social_case_url(@customer_social_case), notice: "Customer social case was successfully created." }
        format.json { render :show, status: :created, location: @customer_social_case }
        format.js
      else
        @customers = Customer.all
        @time_units = TimeUnit.all

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_social_case.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /customer_social_cases/1 or /customer_social_cases/1.json
  def update
    respond_to do |format|
      if @customer_social_case.update(customer_social_case_params)
        @customer_social_cases = CustomerSocialCase.all

        format.html { redirect_to customer_social_case_url(@customer_social_case), notice: "Customer social case was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_social_case }
        format.js
      else
        @customers = Customer.all
        @time_units = TimeUnit.all
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_social_case.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @customer_social_case = CustomerSocialCase.find_by(uid: params[:customer_social_case_id])
  end

  # DELETE /customer_social_cases/1 or /customer_social_cases/1.json
  def destroy
    @customer_social_case.destroy

    respond_to do |format|
      format.html { redirect_to customer_social_cases_url, notice: "Customer social case was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_social_case
      @customer_social_case = CustomerSocialCase.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_social_case_params
      params.require(:customer_social_case).permit(:uid, :customer_id, :dish_number, :time_unit_id)
    end
end
