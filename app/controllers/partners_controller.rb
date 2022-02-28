class PartnersController < ApplicationController

  #authorize_resource
  load_and_authorize_resource :except => [:delete]
   
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_partner, only: %i[ show edit update destroy ]

  # GET /partners or /partners.json
  def index
    @partners = Partner.all
  end

  # GET /partners/1 or /partners/1.json
  def show
  end

  # GET /partners/new
  def new
    @partner = Partner.new
  end

  # GET /partners/1/edit
  def edit
  end

  # POST /partners or /partners.json
  def create
    @partner = current_account.partners.build(partner_params)

    respond_to do |format|
      if @partner.save
        @partners = Partner.all
        format.html { redirect_to partner_url(@partner), notice: "Partner was successfully created." }
        format.json { render :show, status: :created, location: @partner }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partners/1 or /partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        @partners = Partner.all
        format.html { redirect_to partner_url(@partner), notice: "Partner was successfully updated." }
        format.json { render :show, status: :ok, location: @partner }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @partner = Partner.find_by(uid: params[:partner_id])
    end

  # DELETE /partners/1 or /partners/1.json
  def destroy
    @partner.destroy

    respond_to do |format|
      format.html { redirect_to partners_url, notice: "Partner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:partner).permit(:company_name, :first_name, :last_name, :civility, :address, :city, :country, :phone, :email, :description)
    end
end
