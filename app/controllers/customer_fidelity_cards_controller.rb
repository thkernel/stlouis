class CustomerFidelityCardsController < ApplicationController
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_customer_fidelity_card, only: %i[ show edit update destroy ]

  # GET /customer_fidelity_cards or /customer_fidelity_cards.json
  def index
    @customer_fidelity_cards = CustomerFidelityCard.all
  end

  # GET /customer_fidelity_cards/1 or /customer_fidelity_cards/1.json
  def show
  end

  # GET /customer_fidelity_cards/new
  def new
    @fidelity_cards = FidelityCard.where(status: "Inactive")
    @customers = Customer.all
    @customer_fidelity_card = CustomerFidelityCard.new
  end

  # GET /customer_fidelity_cards/1/edit
  def edit
     @fidelity_cards = FidelityCard.where(status: "Inactive")
    @customers = Customer.all
  end

  # POST /customer_fidelity_cards or /customer_fidelity_cards.json
  def create
    @customer_fidelity_card = current_account.customer_fidelity_cards.build(customer_fidelity_card_params)

    respond_to do |format|
      if @customer_fidelity_card.save
        @customer_fidelity_cards = CustomerFidelityCard.all
        format.html { redirect_to customer_fidelity_card_url(@customer_fidelity_card), notice: "Customer fidelity card was successfully created." }
        format.json { render :show, status: :created, location: @customer_fidelity_card }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_fidelity_card.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /customer_fidelity_cards/1 or /customer_fidelity_cards/1.json
  def update
    respond_to do |format|
      if @customer_fidelity_card.update(customer_fidelity_card_params)
        @customer_fidelity_cards = CustomerFidelityCard.all
        format.html { redirect_to customer_fidelity_card_url(@customer_fidelity_card), notice: "Customer fidelity card was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_fidelity_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_fidelity_card.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @customer_fidelity_card = CustomerFidelityCard.find_by(uid: params[:customer_fidelity_card_id])
  end

  # DELETE /customer_fidelity_cards/1 or /customer_fidelity_cards/1.json
  def destroy
    @customer_fidelity_card.destroy

    respond_to do |format|
      format.html { redirect_to customer_fidelity_cards_url, notice: "Customer fidelity card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_fidelity_card
      @customer_fidelity_card = CustomerFidelityCard.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_fidelity_card_params
      params.require(:customer_fidelity_card).permit(:customer_id, :fidelity_card_id)
    end
end
