class FoodsController < ApplicationController
   #authorize_resource
   load_and_authorize_resource :except => [:delete]
   
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_food, only: %i[ show edit update destroy ]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show
    render layout: "front"
  end

  def shop 
    @foods = Food.order(created_at: :desc).paginate(:page => params[:page], :per_page => 9)
    render layout: "front"
  end

  def all_foods
    @foods = Food.paginate(:page => params[:page], :per_page => 6)
  end

  # GET /foods/new
  def new
    @food_categories = FoodCategory.all
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
    @food_categories = FoodCategory.all
  end

  # POST /foods or /foods.json
  def create
    @food = current_account.foods.build(food_params)

    respond_to do |format|
      if @food.save
        @foods = Food.all
        format.html { redirect_to food_url(@food), notice: "Food was successfully created." }
        format.json { render :show, status: :created, location: @food }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        @foods = Food.all
        format.html { redirect_to food_url(@food), notice: "Food was successfully updated." }
        format.json { render :show, status: :ok, location: @food }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @food = Food.find_by(uid: params[:food_id])
    end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: "Food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find_by(uid: params[:uid])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:name, :food_category_id,  :price, :descriptions, :status)
    end
end
