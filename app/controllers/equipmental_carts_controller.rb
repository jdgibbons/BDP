class EquipmentalCartsController < ApplicationController
  before_action :set_equipmental_cart, only: [:show, :edit, :update, :destroy]

  # GET /equipmental_carts
  # GET /equipmental_carts.json
  def index
    @equipmental_carts = EquipmentalCart.all
  end

  # GET /equipmental_carts/1
  # GET /equipmental_carts/1.json
  def show
  end

  # GET /equipmental_carts/new
  def new
    @equipmental_cart = EquipmentalCart.new
  end

  # GET /equipmental_carts/1/edit
  def edit
  end

  # POST /equipmental_carts
  # POST /equipmental_carts.json
  def create
    @equipmental_cart = EquipmentalCart.new(equipmental_cart_params)

    respond_to do |format|
      if @equipmental_cart.save
        format.html { redirect_to @equipmental_cart, notice: 'Equipmental cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @equipmental_cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @equipmental_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipmental_carts/1
  # PATCH/PUT /equipmental_carts/1.json
  def update
    respond_to do |format|
      if @equipmental_cart.update(equipmental_cart_params)
        format.html { redirect_to @equipmental_cart, notice: 'Equipmental cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @equipmental_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipmental_carts/1
  # DELETE /equipmental_carts/1.json
  def destroy
    @equipmental_cart.destroy
    respond_to do |format|
      format.html { redirect_to equipmental_carts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipmental_cart
      @equipmental_cart = EquipmentalCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipmental_cart_params
      params[:equipmental_cart]
    end
end
