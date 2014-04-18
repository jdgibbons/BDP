class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @page_title = "orders"
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @page_title = "orders"
  end

  # GET /orders/new
  def new
    @page_title = "orders"
    @customers = Customer.all.sort_by { |cust| cust.name }
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @page_title = "orders"
  end

  # POST /orders
  # POST /orders.json
  def create
    @page_title = "orders"
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @page_title = "orders"
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_id, :description, :quantity,
                                    equipmental_line_items_attributes: [:id, :order_id, :equipmental_id, :quantity, :_destroy],
                                    labor_line_items_attributes: [:id, :order_id, :labor_id, :quantity, :_destroy],
                                    material_line_items_attributes: [:id, :order_id, :material_id, :quantity, :_destroy])
    end
end
