class UnitiesController < ApplicationController
   #authorize_resource
   load_and_authorize_resource :except => [:delete]
   
  before_action :authenticate_account!
  layout "dashboard"
  
  before_action :set_unity, only: %i[ show edit update destroy ]

  # GET /unities or /unities.json
  def index
    @unities = Unity.all
  end

  # GET /unities/1 or /unities/1.json
  def show
  end

  # GET /unities/new
  def new
    @unity = Unity.new
  end

  # GET /unities/1/edit
  def edit
  end

  # POST /unities or /unities.json
  def create
    @unity = current_account.unities.build(unity_params)

    respond_to do |format|
      if @unity.save
        @unities = Unity.all
        format.html { redirect_to unity_url(@unity), notice: "Unity was successfully created." }
        format.json { render :show, status: :created, location: @unity }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unity.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /unities/1 or /unities/1.json
  def update
    respond_to do |format|
      if @unity.update(unity_params)
        @unities = Unity.all
        format.html { redirect_to unity_url(@unity), notice: "Unity was successfully updated." }
        format.json { render :show, status: :ok, location: @unity }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unity.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @unity = Unity.find_by(uid: params[:unity_id])
    end
  # DELETE /unities/1 or /unities/1.json
  def destroy
    @unity.destroy

    respond_to do |format|
      format.html { redirect_to unities_url, notice: "Unity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unity
      @unity = Unity.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unity_params
      params.require(:unity).permit(:name, :decription)
    end
end
