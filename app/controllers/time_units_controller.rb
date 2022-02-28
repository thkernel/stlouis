class TimeUnitsController < ApplicationController
  load_and_authorize_resource :except => [:delete]
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_time_unit, only: %i[ show edit update destroy ]

  # GET /time_units or /time_units.json
  def index
    @time_units = TimeUnit.all
  end

  # GET /time_units/1 or /time_units/1.json
  def show
  end

  # GET /time_units/new
  def new
    @time_unit = TimeUnit.new
  end

  # GET /time_units/1/edit
  def edit
  end

  # POST /time_units or /time_units.json
  def create
    @time_unit = current_account.time_units.build(time_unit_params)

    respond_to do |format|
      if @time_unit.save
        @time_units = TimeUnit.all

        format.html { redirect_to time_unit_url(@time_unit), notice: "Time unit was successfully created." }
        format.json { render :show, status: :created, location: @time_unit }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_units/1 or /time_units/1.json
  def update
    respond_to do |format|
      if @time_unit.update(time_unit_params)
        @time_units = TimeUnit.all

        format.html { redirect_to time_unit_url(@time_unit), notice: "Time unit was successfully updated." }
        format.json { render :show, status: :ok, location: @time_unit }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_unit.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @time_unit = TimeUnit.find_by(uid: params[:time_unit_id])
  end

  # DELETE /time_units/1 or /time_units/1.json
  def destroy
    @time_unit.destroy

    respond_to do |format|
      format.html { redirect_to time_units_url, notice: "Time unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_unit
      @time_unit = TimeUnit.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_unit_params
      params.require(:time_unit).permit(:name)
    end
end
