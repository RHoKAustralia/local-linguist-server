class MunicipalitiesController < ApplicationController
  before_action :set_municipality, only: [:show, :edit, :update, :destroy]

  # GET /municipalities
  # GET /municipalities.json
  def index
    @municipalities = Municipality.all
  end

  # GET /municipalities/1
  # GET /municipalities/1.json
  def show
  end

  # GET /municipalities/new
  def new
    @municipality = Municipality.new
  end

  # GET /municipalities/1/edit
  def edit
  end

  # POST /municipalities
  # POST /municipalities.json
  def create
    @municipality = Municipality.new(municipality_params)

    respond_to do |format|
      if @municipality.save
        format.html { redirect_to @municipality, notice: 'Municipality was successfully created.' }
        format.json { render :show, status: :created, location: @municipality }
      else
        format.html { render :new }
        format.json { render json: @municipality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipalities/1
  # PATCH/PUT /municipalities/1.json
  def update
    respond_to do |format|
      if @municipality.update(municipality_params)
        format.html { redirect_to @municipality, notice: 'Municipality was successfully updated.' }
        format.json { render :show, status: :ok, location: @municipality }
      else
        format.html { render :edit }
        format.json { render json: @municipality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipalities/1
  # DELETE /municipalities/1.json
  def destroy
    @municipality.destroy
    respond_to do |format|
      format.html { redirect_to municipalities_url, notice: 'Municipality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipality
      @municipality = Municipality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def municipality_params
      params.require(:municipality).permit(:name, :region_id)
    end
end
