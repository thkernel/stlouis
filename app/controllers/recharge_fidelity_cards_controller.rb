class RechargeFidelityCardsController < ApplicationController
   authorize_resource
   
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_recharge_fidelity_card, only: %i[ show edit update destroy ]

  # GET /recharge_fidelity_cards or /recharge_fidelity_cards.json
  def index
    @recharge_fidelity_cards = RechargeFidelityCard.all
  end

  # GET /recharge_fidelity_cards/1 or /recharge_fidelity_cards/1.json
  def show
  end

  # GET /recharge_fidelity_cards/new
  def new
    @fidelity_cards = FidelityCard.where(status: "Active")
    @customers = Customer.all

    @recharge_fidelity_card = RechargeFidelityCard.new
  end

  # GET /recharge_fidelity_cards/1/edit
  def edit
    @fidelity_cards = FidelityCard.where(status: "Active")
    @customers = Customer.all
  end

  # POST /recharge_fidelity_cards or /recharge_fidelity_cards.json
  def create
    @recharge_fidelity_card = current_account.recharge_fidelity_cards.build(recharge_fidelity_card_params)

    respond_to do |format|
      if @recharge_fidelity_card.save
        @recharge_fidelity_cards = RechargeFidelityCard.all
        format.html { redirect_to recharge_fidelity_card_url(@recharge_fidelity_card), notice: "Recharge fidelity card was successfully created." }
        format.json { render :show, status: :created, location: @recharge_fidelity_card }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recharge_fidelity_card.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /recharge_fidelity_cards/1 or /recharge_fidelity_cards/1.json
  def update
    respond_to do |format|
      if @recharge_fidelity_card.update(recharge_fidelity_card_params)
        @recharge_fidelity_cards = RechargeFidelityCard.all
        format.html { redirect_to recharge_fidelity_card_url(@recharge_fidelity_card), notice: "Recharge fidelity card was successfully updated." }
        format.json { render :show, status: :ok, location: @recharge_fidelity_card }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recharge_fidelity_card.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @recharge_fidelity_card = RechargeFidelityCard.find_by(uid: params[:recharge_fidelity_card_id])
    end

  # DELETE /recharge_fidelity_cards/1 or /recharge_fidelity_cards/1.json
  def destroy
    @recharge_fidelity_card.destroy

    respond_to do |format|
      format.html { redirect_to recharge_fidelity_cards_url, notice: "Recharge fidelity card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recharge_fidelity_card
      @recharge_fidelity_card = RechargeFidelityCard.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recharge_fidelity_card_params
      params.require(:recharge_fidelity_card).permit(:fidelity_card_id, :amount)
    end
end
