require 'rails_helper'

RSpec.describe InterviewsController, type: :controller do

  let(:valid_attributes) {
    {
      study_id: FactoryGirl.create(:study).id,
      interviewer_id: FactoryGirl.create(:interviewer).id,
      interviewee_id: FactoryGirl.create(:interviewee).id,
      language_id: FactoryGirl.create(:language).id
    }
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
      get :index, {}, valid_session
      expect(assigns(:interviews)).to eq([interview])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested interview as @interview' do
      interview = Interview.create! valid_attributes
      get :show, {:id => interview.to_param}, valid_session
      expect(assigns(:interview)).to eq(interview)
    end
  end

  describe 'GET #new' do
    it 'assigns a new interview as @interview' do
      get :new, {}, valid_session
      expect(assigns(:interview)).to be_a_new(Interview)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested interview as @interview' do
      interview = Interview.create! valid_attributes
      get :edit, {:id => interview.to_param}, valid_session
      expect(assigns(:interview)).to eq(interview)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Interview' do
        expect {
          post :create, {:interview => valid_attributes}, valid_session
        }.to change(Interview, :count).by(1)
      end

      it 'assigns a newly created interview as @interview' do
        post :create, {:interview => valid_attributes}, valid_session
        expect(assigns(:interview)).to be_a(Interview)
        expect(assigns(:interview)).to be_persisted
      end

      it 'redirects to the created interview' do
        post :create, {:interview => valid_attributes}, valid_session
        expect(response).to redirect_to(Interview.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved interview as @interview' do
        post :create, {:interview => invalid_attributes}, valid_session
        expect(assigns(:interview)).to be_a_new(Interview)
      end

      it "re-renders the 'new' template" do
        post :create, {:interview => invalid_attributes}, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { valid_attributes.merge(interview_time: DateTime.parse('2017-03-28')) }

      it 'updates the requested interview' do
        interview = Interview.create! valid_attributes
        put :update, {:id => interview.to_param, :interview => new_attributes}, valid_session
        interview.reload
        expect(interview.interview_time).to eq DateTime.parse('2017-03-28')
      end

      it 'assigns the requested interview as @interview' do
        interview = Interview.create! valid_attributes
        put :update, {:id => interview.to_param, :interview => valid_attributes}, valid_session
        expect(assigns(:interview)).to eq(interview)
      end

      it 'redirects to the interview' do
        interview = Interview.create! valid_attributes
        put :update, {:id => interview.to_param, :interview => valid_attributes}, valid_session
        expect(response).to redirect_to(interview)
      end
    end

    context 'with invalid params' do
      it 'assigns the interview as @interview' do
        interview = Interview.create! valid_attributes
        put :update, {:id => interview.to_param, :interview => invalid_attributes}, valid_session
        expect(assigns(:interview)).to eq(interview)
      end

      it "re-renders the 'edit' template" do
        interview = Interview.create! valid_attributes
        put :update, {:id => interview.to_param, :interview => invalid_attributes}, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested interview' do
      interview = Interview.create! valid_attributes
      expect {
        delete :destroy, {:id => interview.to_param}, valid_session
      }.to change(Interview, :count).by(-1)
    end

    it 'redirects to the interviews list' do
      interview = Interview.create! valid_attributes
      delete :destroy, {:id => interview.to_param}, valid_session
      expect(response).to redirect_to(interviews_url)
    end
  end

end
