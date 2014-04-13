class MaterialCartsController < ApplicationController
  before_action :set_material_cart, only: [:show, :edit, :update, :destroy]

  # GET /material_carts
  # GET /material_carts.json
  def index
    @material_carts = MaterialCart.all
  end

  # GET /material_carts/1
  # GET /material_carts/1.json
  def show
  end

  # GET /material_carts/new
  def new
    @material_cart = MaterialCart.new
  end

  # GET /material_carts/1/edit
  def edit
  end

  # POST /material_carts
  # POST /material_carts.json
  def create
    @material_cart = MaterialCart.new(material_cart_params)

    respond_to do |format|
      if @material_cart.save
        format.html { redirect_to @material_cart, notice: 'Material cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @material_cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @material_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_carts/1
  # PATCH/PUT /material_carts/1.json
  def update
    respond_to do |format|
      if @material_cart.update(material_cart_params)
        format.html { redirect_to @material_cart, notice: 'Material cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @material_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_carts/1
  # DELETE /material_carts/1.json
  def destroy
    @material_cart.destroy
    respond_to do |format|
      format.html { redirect_to material_carts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_cart
      @material_cart = MaterialCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_cart_params
      params[:material_cart]
    end
end
