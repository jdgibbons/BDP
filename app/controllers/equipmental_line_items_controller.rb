class EquipmentalLineItemsController < ApplicationController
  include CurrentEquipmentalCart
  before_action :set_equipmental_cart, only: [:create]
  before_action :set_equipmental_line_item, only: [:show, :edit, :update, :destroy]

  # GET /equipmental_line_items
  # GET /equipmental_line_items.json
  def index
    @equipmental_line_items = EquipmentalLineItem.all
  end

  # GET /equipmental_line_items/1
  # GET /equipmental_line_items/1.json
  def show
  end

  # GET /equipmental_line_items/new
  def new
    @equipmental_line_item = EquipmentalLineItem.new
  end

  # GET /equipmental_line_items/1/edit
  def edit
  end

  # POST /equipmental_line_items
  # POST /equipmental_line_items.json
  def create
    @equipmental_line_item = EquipmentalLineItem.new(equipmental_line_item_params)

    respond_to do |format|
      if @equipmental_line_item.save
        format.html { redirect_to @equipmental_line_item, notice: 'Equipmental line item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @equipmental_line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @equipmental_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipmental_line_items/1
  # PATCH/PUT /equipmental_line_items/1.json
  def update
    respond_to do |format|
      if @equipmental_line_item.update(equipmental_line_item_params)
        format.html { redirect_to @equipmental_line_item, notice: 'Equipmental line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @equipmental_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipmental_line_items/1
  # DELETE /equipmental_line_items/1.json
  def destroy
    @equipmental_line_item.destroy
    respond_to do |format|
      format.html { redirect_to equipmental_line_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipmental_line_item
      @equipmental_line_item = EquipmentalLineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipmental_line_item_params
      params.require(:equipmental_line_item).permit(:equipmental_id, :equipmental_cart_id)
    end
end
