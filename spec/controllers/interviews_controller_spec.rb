require 'rails_helper'

RSpec.describe InterviewsController, type: :controller do

  let(:valid_attributes) {
    FactoryBot.attributes_for(:interview).merge( {
      study_id: FactoryBot.create(:study).id,
      interviewer_id: FactoryBot.create(:interviewer).id,
      interviewee_id: FactoryBot.create(:interviewee).id,
      language_id: FactoryBot.create(:language).id,
      locale_id: FactoryBot.create(:locale).id,
      zipfile_file_name: 'blah.zip',
      zipfile_content_type: 'application/zip',
      zipfile_file_size: 1024,
      zipfile_updated_at: DateTime.now
    } )
  }

  let(:invalid_attributes) {
    {
      study_id: nil,
      interviewer_id: nil,
      interviewee_id: nil,
      language_id: nil
    }
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all interviews as @interviews' do
      interview = Interview.create! valid_attributes
      get :index, params: {}
      expect(assigns(:interviews)).to eq([interview])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested interview as @interview' do
      interview = Interview.create! valid_attributes
      get :show, params: {id: interview}
      expect(assigns(:interview)).to eq(interview)
    end
  end

  describe 'GET #new' do
    it 'assigns a new interview as @interview' do
      get :new, params: {}
      expect(assigns(:interview)).to be_a_new(Interview)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested interview as @interview' do
      interview = Interview.create! valid_attributes
      get :edit, params: {id: interview}
      expect(assigns(:interview)).to eq(interview)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Interview' do
        expect {
          post :create, params: {interview: valid_attributes}
        }.to change(Interview, :count).by(1)
      end

      it 'assigns a newly created interview as @interview' do
        post :create, params: {interview:  valid_attributes}
        expect(assigns(:interview)).to be_a(Interview)
        expect(assigns(:interview)).to be_persisted
      end

      it 'redirects to the created interview' do
        post :create, params: {interview:  valid_attributes}
        expect(response).to redirect_to(Interview.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved interview as @interview' do
        post :create, params: {interview:  invalid_attributes}
        expect(assigns(:interview)).to be_a_new(Interview)
      end

      it "re-renders the 'new' template" do
        post :create, params: {interview:  invalid_attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { valid_attributes.merge(interview_time: DateTime.parse('2017-03-28')) }

      it 'updates the requested interview' do
        interview = Interview.create! valid_attributes
        put :update, params: {id:  interview, interview:  new_attributes}
        interview.reload
        expect(interview.interview_time).to eq DateTime.parse('2017-03-28')
      end

      it 'assigns the requested interview as @interview' do
        interview = Interview.create! valid_attributes
        put :update, params: {id:  interview, interview:  valid_attributes}
        expect(assigns(:interview)).to eq(interview)
      end

      it 'redirects to the interview' do
        interview = Interview.create! valid_attributes
        put :update, params: {id:  interview, interview:  valid_attributes}
        expect(response).to redirect_to(interview)
      end
    end

    context 'with invalid params' do
      it 'assigns the interview as @interview' do
        interview = Interview.create! valid_attributes
        put :update, params: {id:  interview, interview:  invalid_attributes}
        expect(assigns(:interview)).to eq(interview)
      end

      it "re-renders the 'edit' template" do
        interview = Interview.create! valid_attributes
        put :update, params: {id:  interview, interview:  invalid_attributes}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested interview' do
      interview = Interview.create! valid_attributes
      expect {
        delete :destroy, params: {id:  interview}
      }.to change(Interview, :count).by(-1)
    end

    it 'redirects to the interviews list' do
      interview = Interview.create! valid_attributes
      delete :destroy, params: {id:  interview}
      expect(response).to redirect_to(interviews_url)
    end
  end

end
