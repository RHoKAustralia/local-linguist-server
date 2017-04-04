require 'rails_helper'

RSpec.describe RecordingsController, type: :controller do

  let(:valid_attributes) {
    {
      recorded: DateTime.parse('2015-09-28 17:33:31'),
      interview_id: FactoryGirl.create(:interview).id,
      phrase_id: FactoryGirl.create(:phrase).id
    }
  }

  let(:invalid_attributes) {
    {
      recorded: nil,
      interview_id: nil,
      phrase_id: nil
    }
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all recordings as @recordings' do
      recording = Recording.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:recordings)).to eq([recording])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested recording as @recording' do
      recording = Recording.create! valid_attributes
      get :show, {:id => recording.to_param}, valid_session
      expect(assigns(:recording)).to eq(recording)
    end
  end

  describe 'GET #new' do
    it 'assigns a new recording as @recording' do
      get :new, {}, valid_session
      expect(assigns(:recording)).to be_a_new(Recording)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested recording as @recording' do
      recording = Recording.create! valid_attributes
      get :edit, {:id => recording.to_param}, valid_session
      expect(assigns(:recording)).to eq(recording)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Recording' do
        expect {
          post :create, {:recording => valid_attributes}, valid_session
        }.to change(Recording, :count).by(1)
      end

      it 'assigns a newly created recording as @recording' do
        post :create, {:recording => valid_attributes}, valid_session
        expect(assigns(:recording)).to be_a(Recording)
        expect(assigns(:recording)).to be_persisted
      end

      it 'redirects to the created recording' do
        post :create, {:recording => valid_attributes}, valid_session
        expect(response).to redirect_to(Recording.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved recording as @recording' do
        post :create, {:recording => invalid_attributes}, valid_session
        expect(assigns(:recording)).to be_a_new(Recording)
      end

      it "re-renders the 'new' template" do
        post :create, {:recording => invalid_attributes}, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { recorded: DateTime.parse('2015-09-28 17:33:30') }
      }

      it 'updates the requested recording' do
        recording = Recording.create! valid_attributes
        put :update, {:id => recording.to_param, :recording => new_attributes}, valid_session
        recording.reload
        expect(recording.recorded).to eq(DateTime.parse('2015-09-28 17:33:30'))
      end

      it 'assigns the requested recording as @recording' do
        recording = Recording.create! valid_attributes
        put :update, {:id => recording.to_param, :recording => valid_attributes}, valid_session
        expect(assigns(:recording)).to eq(recording)
      end

      it 'redirects to the recording' do
        recording = Recording.create! valid_attributes
        put :update, {:id => recording.to_param, :recording => valid_attributes}, valid_session
        expect(response).to redirect_to(recording)
      end
    end

    context 'with invalid params' do
      it 'assigns the recording as @recording' do
        recording = Recording.create! valid_attributes
        put :update, {:id => recording.to_param, :recording => invalid_attributes}, valid_session
        expect(assigns(:recording)).to eq(recording)
      end

      it "re-renders the 'edit' template" do
        recording = Recording.create! valid_attributes
        put :update, {:id => recording.to_param, :recording => invalid_attributes}, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested recording' do
      recording = Recording.create! valid_attributes
      expect {
        delete :destroy, {:id => recording.to_param}, valid_session
      }.to change(Recording, :count).by(-1)
    end

    it 'redirects to the recordings list' do
      recording = Recording.create! valid_attributes
      delete :destroy, {:id => recording.to_param}, valid_session
      expect(response).to redirect_to(recordings_url)
    end
  end

end
