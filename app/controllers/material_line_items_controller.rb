class MaterialLineItemsController < ApplicationController
  before_action :set_material_cart, only: [:create]
  before_action :set_material_line_item, only: [:show, :edit, :update, :destroy]

  # GET /material_line_items
  # GET /material_line_items.json
  def index
    @material_line_items = MaterialLineItem.all
  end

  # GET /material_line_items/1
  # GET /material_line_items/1.json
  def show
  end

  # GET /material_line_items/new
  def new
    @material_line_item = MaterialLineItem.new
  end

  # GET /material_line_items/1/edit
  def edit
  end

  # POST /material_line_items
  # POST /material_line_items.json
  def create
    @material_line_item = MaterialLineItem.new(material_line_item_params)

    respond_to do |format|
      if @material_line_item.save
        format.html { redirect_to @material_line_item, notice: 'Material line item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @material_line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @material_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_line_items/1
  # PATCH/PUT /material_line_items/1.json
  def update
    respond_to do |format|
      if @material_line_item.update(material_line_item_params)
        format.html { redirect_to @material_line_item, notice: 'Material line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @material_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_line_items/1
  # DELETE /material_line_items/1.json
  def destroy
    @material_line_item.destroy
    respond_to do |format|
      format.html { redirect_to material_line_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_line_item
      @material_line_item = MaterialLineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_line_item_params
      params.require(:material_line_item).permit(:material_id, :material_cart_id)
    end
end
