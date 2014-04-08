class EquipmentalsController < ApplicationController
  before_action :set_equipmental, only: [:show, :edit, :update, :destroy]

  # GET /equipmentals
  # GET /equipmentals.json
  def index
    @equipmentals = Equipmental.all
  end

  # GET /equipmentals/1
  # GET /equipmentals/1.json
  def show
  end

  # GET /equipmentals/new
  def new
    @equipmental = Equipmental.new
  end

  # GET /equipmentals/1/edit
  def edit
  end

  # POST /equipmentals
  # POST /equipmentals.json
  def create
    @equipmental = Equipmental.new(equipmental_params)

    respond_to do |format|
      if @equipmental.save
        format.html { redirect_to @equipmental, notice: 'Equipmental was successfully created.' }
        format.json { render action: 'show', status: :created, location: @equipmental }
      else
        format.html { render action: 'new' }
        format.json { render json: @equipmental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipmentals/1
  # PATCH/PUT /equipmentals/1.json
  def update
    respond_to do |format|
      if @equipmental.update(equipmental_params)
        format.html { redirect_to @equipmental, notice: 'Equipmental was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @equipmental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipmentals/1
  # DELETE /equipmentals/1.json
  def destroy
    @equipmental.destroy
    respond_to do |format|
      format.html { redirect_to equipmentals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipmental
      @equipmental = Equipmental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipmental_params
      params.require(:equipmental).permit(:name, :rate, :units)
    end
end
