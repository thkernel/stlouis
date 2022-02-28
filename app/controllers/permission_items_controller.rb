class PermissionItemsController < ApplicationController
  before_action :set_permission_item, only: %i[ show edit update destroy ]

  # GET /permission_items or /permission_items.json
  def index
    @permission_items = PermissionItem.all
  end

  # GET /permission_items/1 or /permission_items/1.json
  def show
  end

  # GET /permission_items/new
  def new
    @permission_item = PermissionItem.new
  end

  # GET /permission_items/1/edit
  def edit
  end

  # POST /permission_items or /permission_items.json
  def create
    @permission_item = PermissionItem.new(permission_item_params)

    respond_to do |format|
      if @permission_item.save
        format.html { redirect_to permission_item_url(@permission_item), notice: "Permission item was successfully created." }
        format.json { render :show, status: :created, location: @permission_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @permission_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permission_items/1 or /permission_items/1.json
  def update
    respond_to do |format|
      if @permission_item.update(permission_item_params)
        format.html { redirect_to permission_item_url(@permission_item), notice: "Permission item was successfully updated." }
        format.json { render :show, status: :ok, location: @permission_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @permission_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permission_items/1 or /permission_items/1.json
  def destroy
    @permission_item.destroy

    respond_to do |format|
      format.html { redirect_to permission_items_url, notice: "Permission item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission_item
      @permission_item = PermissionItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def permission_item_params
      params.require(:permission_item).permit(:uid, :permission_id, :action_name, :status)
    end
end
