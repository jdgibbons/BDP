class LaborCartsController < ApplicationController
  before_action :set_labor_cart, only: [:show, :edit, :update, :destroy]

  # GET /labor_carts
  # GET /labor_carts.json
  def index
    @labor_carts = LaborCart.all
  end

  # GET /labor_carts/1
  # GET /labor_carts/1.json
  def show
  end

  # GET /labor_carts/new
  def new
    @labor_cart = LaborCart.new
  end

  # GET /labor_carts/1/edit
  def edit
  end

  # POST /labor_carts
  # POST /labor_carts.json
  def create
    @labor_cart = LaborCart.new(labor_cart_params)

    respond_to do |format|
      if @labor_cart.save
        format.html { redirect_to @labor_cart, notice: 'Labor cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @labor_cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @labor_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labor_carts/1
  # PATCH/PUT /labor_carts/1.json
  def update
    respond_to do |format|
      if @labor_cart.update(labor_cart_params)
        format.html { redirect_to @labor_cart, notice: 'Labor cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @labor_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labor_carts/1
  # DELETE /labor_carts/1.json
  def destroy
    @labor_cart.destroy
    respond_to do |format|
      format.html { redirect_to labor_carts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labor_cart
      @labor_cart = LaborCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labor_cart_params
      params[:labor_cart]
    end
end
