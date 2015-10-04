class IntervieweesController < ApplicationController
  before_action :set_interviewee, only: [:show, :edit, :update, :destroy]

  # GET /interviewees
  # GET /interviewees.json
  def index
    @interviewees = Interviewee.all
  end

  # GET /interviewees/1
  # GET /interviewees/1.json
  def show
  end

  # GET /interviewees/new
  def new
    @interviewee = Interviewee.new
  end

  # GET /interviewees/1/edit
  def edit
  end

  # POST /interviewees
  # POST /interviewees.json
  def create
    @interviewee = Interviewee.new(interviewee_params)

    respond_to do |format|
      if @interviewee.save
        format.html { redirect_to @interviewee, notice: 'Interviewee was successfully created.' }
        format.json { render :show, status: :created, location: @interviewee }
      else
        format.html { render :new }
        format.json { render json: @interviewee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviewees/1
  # PATCH/PUT /interviewees/1.json
  def update
    respond_to do |format|
      if @interviewee.update(interviewee_params)
        format.html { redirect_to @interviewee, notice: 'Interviewee was successfully updated.' }
        format.json { render :show, status: :ok, location: @interviewee }
      else
        format.html { render :edit }
        format.json { render json: @interviewee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviewees/1
  # DELETE /interviewees/1.json
  def destroy
    @interviewee.destroy
    respond_to do |format|
      format.html { redirect_to interviewees_url, notice: 'Interviewee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interviewee
      @interviewee = Interviewee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interviewee_params
      params.require(:interviewee).permit(:name, :mobile, :email, :gender, :occupation, :education_level)
    end
end
