class WorkOrdersController < ApplicationController
  before_action :set_work_order, only: [:show, :edit, :update, :destroy]

  before_filter :reparse_date, only: [:update]

  # GET /work_orders
  # GET /work_orders.json
  def index
    @page_title = "work_orders"
    @work_orders = WorkOrder.all
  end

  # GET /work_orders/1
  # GET /work_orders/1.json
  def show
    @page_title = "work_orders"
    @materials_subtotal = 0.00
    @equipmentals_subtotal = 0.00
    @labors_subtotal = 0.00
    @vendors_subtotal = 0.00
    @cost_of_goods = 0.00;
  end

  # GET /work_orders/new
  def new
    @page_title = "work_orders"
    # @work_order = WorkOrder.new
  end

  # GET /work_orders/1/edit
  def edit
    @page_title = "work_orders"
    @materials = Material.all.sort_by { |matter| matter.name }
    @labors = Labor.all.sort_by { |lab| lab.name }
    @equipmentals = Equipmental.all.sort_by { |equipment| equipment.name }
  end

  # POST /work_orders
  # POST /work_orders.json
  def create
    @work_order = WorkOrder.new(work_order_params)

    # Before saving this work order, check to see if one
    # already exists for for the order id passed in the
    # parameters. If it does, set @work_order to it.
    is_working = order_already_has_work_order
    if is_working != 0
      @work_order = WorkOrder.find(is_working)
    end

    respond_to do |format|
      if @work_order.save
        format.html { redirect_to @work_order, notice: 'Work order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @work_order }
      else
        format.html { render action: 'new' }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_orders/1
  # PATCH/PUT /work_orders/1.json
  def update
    respond_to do |format|
      if @work_order.update(work_order_params)
        format.html { redirect_to @work_order, notice: 'Work order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_orders/1
  # DELETE /work_orders/1.json
  def destroy
    @work_order.destroy
    respond_to do |format|
      format.html { redirect_to work_orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_order_params
      params.require(:work_order).permit(:order_id, :description, :quantity, :completion_date,
                                         wo_material_line_items_attributes: [:id, :order_id, :material_id, :quantity, :_destroy],
                                         wo_vendors_attributes: [:id, :order_id, :quantity, :description, :cost, :_destroy],
                                         wo_labor_line_items_attributes: [:id, :order_id, :labor_id, :quantity, :_destroy],
                                         wo_equipmental_line_items_attributes: [:id, :order_id, :equipmental_id, :quantity, :_destroy])
    end

    def order_already_has_work_order
      order_me = Order.find(params[:work_order][:order_id])
      if order_me.work_order.nil?
        0
      else
        order_me.work_order.id
      end
    end
    # Compensate for the date format problem that is caused by the jquery datepicker
  def reparse_date
    if params[:work_order][:completion_date].nil? || params[:work_order][:completion_date] == ""
      params[:work_order][:completion_date] = ""
      return
    end
    temp_date = params[:work_order][:completion_date].split("/")
    params[:work_order][:completion_date] = temp_date[1] + "/" + temp_date[0] + "/" + temp_date[2]
  end


end
