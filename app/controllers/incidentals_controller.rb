class IncidentalsController < ApplicationController
  before_action :set_incidental, only: [:show, :edit, :update, :destroy]

  # GET /incidentals
  # GET /incidentals.json
  def index
    @incidentals = Incidental.all
  end

  # GET /incidentals/1
  # GET /incidentals/1.json
  def show
  end

  # GET /incidentals/new
  def new
    @incidental = Incidental.new
  end

  # GET /incidentals/1/edit
  def edit
  end

  # POST /incidentals
  # POST /incidentals.json
  def create
    @incidental = Incidental.new(incidental_params)

    respond_to do |format|
      if @incidental.save
        format.html { redirect_to @incidental, notice: 'Incidental was successfully created.' }
        format.json { render action: 'show', status: :created, location: @incidental }
      else
        format.html { render action: 'new' }
        format.json { render json: @incidental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidentals/1
  # PATCH/PUT /incidentals/1.json
  def update
    respond_to do |format|
      if @incidental.update(incidental_params)
        format.html { redirect_to @incidental, notice: 'Incidental was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @incidental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidentals/1
  # DELETE /incidentals/1.json
  def destroy
    @incidental.destroy
    respond_to do |format|
      format.html { redirect_to incidentals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incidental
      @incidental = Incidental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incidental_params
      params.require(:incidental).permit(:description, :cost)
    end
end
