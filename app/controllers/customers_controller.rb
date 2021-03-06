class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @page_title = "customers"
    @customers = Customer.all.sort_by { |custard| custard.name }
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @page_title = "customers"
  end

  # GET /customers/new
  def new
    @page_title = "customers"
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @page_title = "customers"
  end

  # POST /customers
  # POST /customers.json
  def create
    @page_title = "customers"
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @page_title = "customers"
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    if @customer.destroy
      message = "Customer was successfully removed from the database."
    else
      order_names = @customer.orders.map { |o| o.order_number }.join ', '
      message = "'#{@customer.name}' could not be removed from the database due to #{'order'.pluralize(@customer.orders.count)}: #{order_names}."
    end
    respond_to do |format|
      format.html { redirect_to customers_url, :notice => message  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name,
                                       contacts_attributes: [:id, :name, :first_name, :last_name, :telephone, :email, :customer_id, :_destroy],
                                       addresses_attributes: [:id, :line1, :line2, :city, :state, :type, :customer_id, :_destroy ])
    end
end
