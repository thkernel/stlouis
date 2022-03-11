class UnsoldFoodsController < ApplicationController
  before_action :set_unsold_food, only: %i[ show edit update destroy ]
  
  #authorize_resource
  load_and_authorize_resource :except => [:delete]
   
  before_action :authenticate_account!
  

  
  layout "dashboard"
  # GET /unsold_foods or /unsold_foods.json
  def index
    @unsold_foods = UnsoldFood.all
  end

  # GET /unsold_foods/1 or /unsold_foods/1.json
  def show
  end

  # GET /unsold_foods/new
  def new
    @foods = Food.all
    @unsold_food = UnsoldFood.new
  end

  # GET /unsold_foods/1/edit
  def edit
    @foods = Food.all
  end

  # POST /unsold_foods or /unsold_foods.json
  def create
    @unsold_food = current_account.unsold_foods.build(unsold_food_params)

    respond_to do |format|
      if @unsold_food.save
        @unsold_foods = UnsoldFood.all
        format.html { redirect_to unsold_food_url(@unsold_food), notice: "Unsold food was successfully created." }
        format.json { render :show, status: :created, location: @unsold_food }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unsold_food.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /unsold_foods/1 or /unsold_foods/1.json
  def update
    respond_to do |format|
      if @unsold_food.update(unsold_food_params)
        @unsold_foods = UnsoldFood.all
        format.html { redirect_to unsold_food_url(@unsold_food), notice: "Unsold food was successfully updated." }
        format.json { render :show, status: :ok, location: @unsold_food }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unsold_food.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @unsold_food = UnsoldFood.find(params[:unsold_food_id])
  end

  # DELETE /unsold_foods/1 or /unsold_foods/1.json
  def destroy
    @unsold_food.destroy

    respond_to do |format|
      format.html { redirect_to unsold_foods_url, notice: "Unsold food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unsold_food
      @unsold_food = UnsoldFood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unsold_food_params
      params.require(:unsold_food).permit(:food_id, :quantity, :status, :description)
    end
end
