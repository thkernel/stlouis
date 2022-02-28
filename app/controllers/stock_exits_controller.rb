class StockExitsController < ApplicationController
    #authorize_resource
    load_and_authorize_resource :except => [:delete]
    
   before_action :authenticate_account!
  layout "dashboard"
  
  before_action :set_stock_exit, only: %i[ show edit update destroy ]

  # GET /stock_exits or /stock_exits.json
  def index
    @stock_exits = StockExit.all
  end

  # GET /stock_exits/1 or /stock_exits/1.json
  def show
  end

  # GET /stock_exits/new
  def new
    @products = Product.all
    @unities = Unity.all
    @stock_exit = StockExit.new
  end

  # GET /stock_exits/1/edit
  def edit
    @products = Product.all
    @unities = Unity.all
  end

  # POST /stock_exits or /stock_exits.json
  def create
    @stock_exit = current_account.stock_exits.build(stock_exit_params)

    respond_to do |format|
      if @stock_exit.save
        @stock_exits = StockExit.all
        format.html { redirect_to stock_exit_url(@stock_exit), notice: "Stock exit was successfully created." }
        format.json { render :show, status: :created, location: @stock_exit }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock_exit.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /stock_exits/1 or /stock_exits/1.json
  def update
    respond_to do |format|
      if @stock_exit.update(stock_exit_params)
        @stock_exits = StockExit.all
        format.html { redirect_to stock_exit_url(@stock_exit), notice: "Stock exit was successfully updated." }
        format.json { render :show, status: :ok, location: @stock_exit }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock_exit.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  def delete
    @stock_exit = StockExit.find(params[:stock_exit_id])
  end

  # DELETE /stock_exits/1 or /stock_exits/1.json
  def destroy
    @stock_exit.destroy

    respond_to do |format|
      format.html { redirect_to stock_exits_url, notice: "Stock exit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_exit
      @stock_exit = StockExit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_exit_params
      params.require(:stock_exit).permit(:uid, :product_id, :reason, :quantity, :unity_id, :description, :status)
    end
end
