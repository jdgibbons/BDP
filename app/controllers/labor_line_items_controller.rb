class LaborLineItemsController < ApplicationController
  include CurrentLaborCart
  before_action :set_labor_cart, only: [:create]
  before_action :set_labor_line_item, only: [:show, :edit, :update, :destroy]

  # GET /labor_line_items
  # GET /labor_line_items.json
  def index
    @labor_line_items = LaborLineItem.all
  end

  # GET /labor_line_items/1
  # GET /labor_line_items/1.json
  def show
  end

  # GET /labor_line_items/new
  def new
    @labor_line_item = LaborLineItem.new
  end

  # GET /labor_line_items/1/edit
  def edit
  end

  # POST /labor_line_items
  # POST /labor_line_items.json
  def create
    @labor_line_item = LaborLineItem.new(labor_line_item_params)

    respond_to do |format|
      if @labor_line_item.save
        format.html { redirect_to @labor_line_item, notice: 'Labor line item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @labor_line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @labor_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labor_line_items/1
  # PATCH/PUT /labor_line_items/1.json
  def update
    respond_to do |format|
      if @labor_line_item.update(labor_line_item_params)
        format.html { redirect_to @labor_line_item, notice: 'Labor line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @labor_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labor_line_items/1
  # DELETE /labor_line_items/1.json
  def destroy
    @labor_line_item.destroy
    respond_to do |format|
      format.html { redirect_to labor_line_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labor_line_item
      @labor_line_item = LaborLineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labor_line_item_params
      params.require(:labor_line_item).permit(:labor_id, :labor_cart_id)
    end
end
