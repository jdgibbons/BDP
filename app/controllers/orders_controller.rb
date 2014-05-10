class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  before_filter :reparse_date, only: [:update, :create]

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
    @materials_subtotal = 0.00
    @equipmentals_subtotal = 0.00
    @labors_subtotal = 0.00
    @vendors_subtotal = 0.00
    @cost_of_goods = 0.1;
  end

  # GET /orders/new
  def new
    @page_title = "orders"
    # @customers = Customer.all.sort_by { |cust| cust.name }
    @equipmentals = Equipmental.all.sort_by { |equipment| equipment.name }
    @materials = Material.all.sort_by { |matter| matter.name }
    @labors = Labor.all.sort_by { |lab| lab.name }
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @page_title = "orders"
    @equipmentals = Equipmental.all.sort_by { |equipment| equipment.name }
    @materials = Material.all.sort_by { |matter| matter.name }
    @labors = Labor.all.sort_by { |lab| lab.name }
  end

  # POST /orders
  # POST /orders.json
  def create
    @page_title = "orders"
    @equipmentals = Equipmental.all.sort_by { |equipment| equipment.name }
    @materials = Material.all.sort_by { |matter| matter.name }
    @labors = Labor.all.sort_by { |lab| lab.name }
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

  # Compensate for the date format problem that is caused by the jquery datepicker
  def reparse_date
    if params[:order][:completion_date].nil? || params[:order][:completion_date] == ""
      params[:order][:completion] = ""
      return
    end
    temp_date = params[:order][:completion_date].split("/")
    params[:order][:completion_date] = temp_date[1] + "/" + temp_date[0] + "/" + temp_date[2]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_id, :description, :quantity, :completion_date, :incidentals,
                                    equipmental_line_items_attributes: [:id, :order_id, :equipmental_id, :quantity, :_destroy],
                                    labor_line_items_attributes: [:id, :order_id, :labor_id, :quantity, :_destroy],
                                    material_line_items_attributes: [:id, :order_id, :material_id, :quantity, :_destroy],
                                    vendors_attributes: [:id, :order_id, :quantity, :description, :cost, :_destroy])
    end
end
