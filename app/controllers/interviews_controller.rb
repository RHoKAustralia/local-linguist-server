class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  # POST /interviews/upload
  def upload
    respond_to do |format|
      if save_uploaded_interview
        format.json { render :show, status: :created, location: @interview }
      else
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /interviews
  # GET /interviews.json
  def index
    @interviews = Interview.all
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
  end

  # GET /interviews/new
  def new
    @interview = Interview.new
  end

  # GET /interviews/1/edit
  def edit
  end

  # POST /interviews
  # POST /interviews.json
  def create
    @interview = Interview.new(interview_params)

    respond_to do |format|
      if @interview.save
        format.html { redirect_to @interview, notice: 'Interview was successfully created.' }
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviews/1
  # PATCH/PUT /interviews/1.json
  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview }
      else
        format.html { render :edit }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    @interview.destroy
    respond_to do |format|
      format.html { redirect_to interviews_url, notice: 'Interview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_interview
    @interview = Interview.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  def upload_params
    params.require(:interview)
  end

  def recordings_params
    params.require(:interview).require(:recordings)
  end

  def interviewee_params
    params.require(:interviewee)
  end

  def interviewer_params
    params.require(:interviewer)
  end

  def save_uploaded_interview
    interviewee = Interviewee.first_or_create(interviewee_params)
    interviewer = Interviewer.first_or_create(interviewer_params)
    @interview = Interview.first_or_create(
      interview_time: upload_params[:interview_time],
      study_id: upload_params[:study_id],
      locale_id: upload_params[:locale_id],
      interviewer_id: interviewer.id,
      interviewee_id: interviewee.id)
    if @interview.valid?
      if recordings_params
        recordings_params.each do |resp|
          r = Recording.first_or_create(
            resp.permit([:interview_time, :locale_id, :recordings, :study_id]))
          r.save
        end
      end
    end

    # TODO: get the audio url and associate the recording with the interview
    # TODO: Create Answer model to associate answers with an interview

    interviewee.valid? && interviewer.valid? && @interview.valid?
  end
end
