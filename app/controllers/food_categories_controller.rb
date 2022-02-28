class FoodCategoriesController < ApplicationController
   #authorize_resource
   load_and_authorize_resource :except => [:delete]
   
  before_action :authenticate_account!
  layout "dashboard"

  before_action :set_food_category, only: %i[ show edit update destroy ]

  # GET /food_categories or /food_categories.json
  def index
    @food_categories = FoodCategory.all
  end

  # GET /food_categories/1 or /food_categories/1.json
  def show
  end

  # GET /food_categories/new
  def new
    @food_category = FoodCategory.new
  end

  # GET /food_categories/1/edit
  def edit
  end

  # POST /food_categories or /food_categories.json
  def create
    @food_category = current_account.food_categories.build(food_category_params)

    respond_to do |format|
      if @food_category.save
        @food_categories = FoodCategory.all

        format.html { redirect_to food_category_url(@food_category), notice: "Food category was successfully created." }
        format.json { render :show, status: :created, location: @food_category }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /food_categories/1 or /food_categories/1.json
  def update
    respond_to do |format|
      if @food_category.update(food_category_params)
         @food_categories = FoodCategory.all
        format.html { redirect_to food_category_url(@food_category), notice: "Food category was successfully updated." }
        format.json { render :show, status: :ok, location: @food_category }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @food_category = FoodCategory.find_by(uid: params[:food_category_id])
  end

  # DELETE /food_categories/1 or /food_categories/1.json
  def destroy
    @food_category.destroy

    respond_to do |format|
      format.html { redirect_to food_categories_url, notice: "Food category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_category
      @food_category = FoodCategory.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_category_params
      params.require(:food_category).permit(:name, :description, :status)
    end
end
