class FidelityCardsController < ApplicationController
   #authorize_resource
   load_and_authorize_resource :except => [:delete]
   
  before_action :authenticate_account!
  layout "dashboard"
  
  before_action :set_fidelity_card, only: %i[ show edit update destroy ]

  # GET /fidelity_cards or /fidelity_cards.json
  def index
    if current_account.client?

      customer_fidelity_card = CustomerFidelityCard.find_by(customer_id: current_account.accountable.id)
      
      if  customer_fidelity_card.present?
        @fidelity_cards = FidelityCard.where(id: customer_fidelity_card.fidelity_card_id)
      else
        @fidelity_cards = []
      end

    else
      @fidelity_cards = FidelityCard.all
    end
  end

  # GET /fidelity_cards/1 or /fidelity_cards/1.json
  def show
  end

  # GET /fidelity_cards/new
  def new
    @fidelity_card = FidelityCard.new
  end

  # GET /fidelity_cards/1/edit
  def edit
  end

  # POST /fidelity_cards or /fidelity_cards.json
  def create
    @fidelity_card = current_account.fidelity_cards.build(fidelity_card_params)

    respond_to do |format|
      if @fidelity_card.save
        @fidelity_cards = FidelityCard.all
        format.html { redirect_to fidelity_card_url(@fidelity_card), notice: "Fidelity card was successfully created." }
        format.json { render :show, status: :created, location: @fidelity_card }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fidelity_card.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /fidelity_cards/1 or /fidelity_cards/1.json
  def update
    respond_to do |format|
      if @fidelity_card.update(fidelity_card_params)
        @fidelity_cards = FidelityCard.all
        format.html { redirect_to fidelity_card_url(@fidelity_card), notice: "Fidelity card was successfully updated." }
        format.json { render :show, status: :ok, location: @fidelity_card }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fidelity_card.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @fidelity_card = FidelityCard.find_by(uid: params[:fidelity_card_id])
  end

  # DELETE /fidelity_cards/1 or /fidelity_cards/1.json
  def destroy
    @fidelity_card.destroy

    respond_to do |format|
      format.html { redirect_to fidelity_cards_url, notice: "Fidelity card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fidelity_card
      @fidelity_card = FidelityCard.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fidelity_card_params
      params.require(:fidelity_card).permit(:balance, :uid, :status)
    end
end
