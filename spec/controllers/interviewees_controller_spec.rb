require 'rails_helper'

RSpec.describe IntervieweesController, type: :controller do

  let(:locale) { FactoryBot.create(:locale) }
  let(:valid_attributes) {
    {
      name: 'Fred',
      email: 'fred@nerk.com',
      gender: 'Mane',
      occupation: "To'os na'in",
      education_level: 'SMA',
      age: 36,
      locale_id: locale.id,
      lived_whole_life: true,
      first_language: 'Tetum'
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      gender: nil,
      occupation: nil,
      education_level: nil,
      age: nil,
      locale_id: nil,
      first_language: nil
    }
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all interviewees as @interviewees' do
      interviewee = Interviewee.create! valid_attributes
      get :index, params: {}
      expect(assigns(:interviewees)).to eq([interviewee])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested interviewee as @interviewee' do
      interviewee = Interviewee.create! valid_attributes
      get :show, params: {id:  interviewee}
      expect(assigns(:interviewee)).to eq(interviewee)
    end
  end

  describe 'GET #new' do
    it 'assigns a new interviewee as @interviewee' do
      get :new, params: {}
      expect(assigns(:interviewee)).to be_a_new(Interviewee)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested interviewee as @interviewee' do
      interviewee = Interviewee.create! valid_attributes
      get :edit, params: {id:  interviewee}
      expect(assigns(:interviewee)).to eq(interviewee)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Interviewee' do
        expect {
          post :create, params: {interviewee:  valid_attributes}
        }.to change(Interviewee, :count).by(1)
      end

      it 'assigns a newly created interviewee as @interviewee' do
        post :create, params: {interviewee:  valid_attributes}
        expect(assigns(:interviewee)).to be_a(Interviewee)
        expect(assigns(:interviewee)).to be_persisted
      end

      it 'redirects to the created interviewee' do
        post :create, params: {interviewee:  valid_attributes}
        expect(response).to redirect_to(Interviewee.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved interviewee as @interviewee' do
        post :create, params: {interviewee:  invalid_attributes}
        expect(assigns(:interviewee)).to be_a_new(Interviewee)
      end

      it "re-renders the 'new' template" do
        post :create, params: {interviewee:  invalid_attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        valid_attributes.merge(age: 37)
      }

      it 'updates the requested interviewee' do
        interviewee = Interviewee.create! valid_attributes
        put :update, params: {id:  interviewee, interviewee:  new_attributes}
        interviewee.reload
        expect(interviewee.age).to eq 37
      end

      it 'assigns the requested interviewee as @interviewee' do
        interviewee = Interviewee.create! valid_attributes
        put :update, params: {id:  interviewee, interviewee:  valid_attributes}
        expect(assigns(:interviewee)).to eq(interviewee)
      end

      it 'redirects to the interviewee' do
        interviewee = Interviewee.create! valid_attributes
        put :update, params: {id:  interviewee, interviewee:  valid_attributes}
        expect(response).to redirect_to(interviewee)
      end
    end

    context 'with invalid params' do
      it 'assigns the interviewee as @interviewee' do
        interviewee = Interviewee.create! valid_attributes
        put :update, params: {id:  interviewee, interviewee:  invalid_attributes}
        expect(assigns(:interviewee)).to eq(interviewee)
      end

      it "re-renders the 'edit' template" do
        interviewee = Interviewee.create! valid_attributes
        put :update, params: {id:  interviewee, interviewee:  invalid_attributes}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested interviewee' do
      interviewee = Interviewee.create! valid_attributes
      expect {
        delete :destroy, params: {id:  interviewee}
      }.to change(Interviewee, :count).by(-1)
    end

    it 'redirects to the interviewees list' do
      interviewee = Interviewee.create! valid_attributes
      delete :destroy, params: {id:  interviewee}
      expect(response).to redirect_to(interviewees_url)
    end
  end

end
