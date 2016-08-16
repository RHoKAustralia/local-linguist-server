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

  # Never trust parameters from the scary internet, only allow the white list through.
  def interview_params
    params.require(:interview).
      permit(:interview_time, :study_id, :interviewer_id,
             :interviewee_id, :locale_id)
  end

  def upload_params
    params.require(:interview).permit(
      :id, :interviewee_id, :interviewer_id, :locale_id,
      :interview_time,
      :study_id,
      {
        responses: [:text_response, :interview_id,
                    :language_id, :phrase_id, :audio_url]
      },
      interviewer: [
        :name, :email,
        :device_id, :mobile
      ],
      interviewee: [
        :personid, :age, :bornDistrict, :bornMunicipality, :bornVillage,
        :education, :livesInMunicipality, :livesInVillage, :name, :occuption,
        :firstLanguage, :secondLanguage, :thirdLanguage, :fourthLanguage,
        :livedWholeLife, :livedInYears
      ]
    )
  end

  def save_uploaded_interview
    uploaded_interview = upload_params
    interviewee = Interviewee.first_or_create(uploaded_interview[:interviewee])
    interviewer = Interviewer.first_or_create(uploaded_interview[:interviewer])
    @interview = Interview.first_or_create(
      interview_time: uploaded_interview[:interview_time],
      study_id: uploaded_interview[:study_id],
      locale_id: uploaded_interview[:locale_id],
      interviewer_id: interviewer.id,
      interviewee_id: interviewee.id)

    # TODO: get the audio url and associate the recording with the interview

    interviewee.valid? && interviewer.valid? && @interview.valid?
  end
end
