require 'rails_helper'

RSpec.describe InterviewersController, type: :controller do

  let(:valid_attributes) {
    {
      name: 'Barney',
      mobile: '0414444444',
      device_id: '1234',
      email: 'barney@nerk.com'
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      mobile: nil,
      device_id: nil,
      email: nil
    }
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all interviewers as @interviewers' do
      interviewer = Interviewer.create! valid_attributes
      get :index, params: {}
      expect(assigns(:interviewers)).to eq([interviewer])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested interviewer as @interviewer' do
      interviewer = Interviewer.create! valid_attributes
      get :show, params: {id:  interviewer}
      expect(assigns(:interviewer)).to eq(interviewer)
    end
  end

  describe 'GET #new' do
    it 'assigns a new interviewer as @interviewer' do
      get :new, params: {}
      expect(assigns(:interviewer)).to be_a_new(Interviewer)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested interviewer as @interviewer' do
      interviewer = Interviewer.create! valid_attributes
      get :edit, params: {id:  interviewer}
      expect(assigns(:interviewer)).to eq(interviewer)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Interviewer' do
        expect {
          post :create, params: {interviewer:  valid_attributes}
        }.to change(Interviewer, :count).by(1)
      end

      it 'assigns a newly created interviewer as @interviewer' do
        post :create, params: {interviewer:  valid_attributes}
        expect(assigns(:interviewer)).to be_a(Interviewer)
        expect(assigns(:interviewer)).to be_persisted
      end

      it 'redirects to the created interviewer' do
        post :create, params: {interviewer:  valid_attributes}
        expect(response).to redirect_to(Interviewer.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved interviewer as @interviewer' do
        post :create, params: {interviewer:  invalid_attributes}
        expect(assigns(:interviewer)).to be_a_new(Interviewer)
      end

      it "re-renders the 'new' template" do
        post :create, params: {interviewer:  invalid_attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { name: 'Betty' }
      }

      it 'updates the requested interviewer' do
        interviewer = Interviewer.create! valid_attributes
        put :update, params: {id:  interviewer, interviewer:  new_attributes}
        interviewer.reload
        expect(interviewer.name).to eq 'Betty'
      end

      it 'assigns the requested interviewer as @interviewer' do
        interviewer = Interviewer.create! valid_attributes
        put :update, params: {id:  interviewer, interviewer:  valid_attributes}
        expect(assigns(:interviewer)).to eq(interviewer)
      end

      it 'redirects to the interviewer' do
        interviewer = Interviewer.create! valid_attributes
        put :update, params: {id:  interviewer, interviewer:  valid_attributes}
        expect(response).to redirect_to(interviewer)
      end
    end

    context 'with invalid params' do
      it 'assigns the interviewer as @interviewer' do
        interviewer = Interviewer.create! valid_attributes
        put :update, params: {id:  interviewer, interviewer:  invalid_attributes}
        expect(assigns(:interviewer)).to eq(interviewer)
      end

      it "re-renders the 'edit' template" do
        interviewer = Interviewer.create! valid_attributes
        put :update, params: {id:  interviewer, interviewer:  invalid_attributes}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested interviewer' do
      interviewer = Interviewer.create! valid_attributes
      expect {
        delete :destroy, params: {id:  interviewer}
      }.to change(Interviewer, :count).by(-1)
    end

    it 'redirects to the interviewers list' do
      interviewer = Interviewer.create! valid_attributes
      delete :destroy, params: {id:  interviewer}
      expect(response).to redirect_to(interviewers_url)
    end
  end

end
