require 'rails_helper'

RSpec.describe PhrasesController, type: :controller do

  let(:valid_attributes) {
    {
      english_text: 'This is a phrase',
      prompt_text: 'Type in your response',
      study_id: FactoryGirl.create(:study).id,
      response_type_id: 1
    }
  }

  let(:invalid_attributes) {
    { english_text: nil, prompt_text: nil, study_id: nil, response_type_id: nil }
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all phrases as @phrases' do
      phrase = Phrase.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:phrases)).to eq([phrase])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested phrase as @phrase' do
      phrase = Phrase.create! valid_attributes
      get :show, {:id => phrase.to_param}, valid_session
      expect(assigns(:phrase)).to eq(phrase)
    end
  end

  describe 'GET #new' do
    it 'assigns a new phrase as @phrase' do
      get :new, {}, valid_session
      expect(assigns(:phrase)).to be_a_new(Phrase)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested phrase as @phrase' do
      phrase = Phrase.create! valid_attributes
      get :edit, {:id => phrase.to_param}, valid_session
      expect(assigns(:phrase)).to eq(phrase)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Phrase' do
        expect {
          post :create, {:phrase => valid_attributes}, valid_session
        }.to change(Phrase, :count).by(1)
      end

      it 'assigns a newly created phrase as @phrase' do
        post :create, {:phrase => valid_attributes}, valid_session
        expect(assigns(:phrase)).to be_a(Phrase)
        expect(assigns(:phrase)).to be_persisted
      end

      it 'redirects to the created phrase' do
        post :create, {:phrase => valid_attributes}, valid_session
        expect(response).to redirect_to(Phrase.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved phrase as @phrase' do
        post :create, {:phrase => invalid_attributes}, valid_session
        expect(assigns(:phrase)).to be_a_new(Phrase)
      end

      it "re-renders the 'new' template" do
        post :create, {:phrase => invalid_attributes}, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { english_text: 'The quick brown fox' }
      }

      it 'updates the requested phrase' do
        phrase = Phrase.create! valid_attributes
        put :update, {:id => phrase.to_param, :phrase => new_attributes}, valid_session
        phrase.reload
        expect(phrase.english_text).to eq 'The quick brown fox'
      end

      it 'assigns the requested phrase as @phrase' do
        phrase = Phrase.create! valid_attributes
        put :update, {:id => phrase.to_param, :phrase => valid_attributes}, valid_session
        expect(assigns(:phrase)).to eq(phrase)
      end

      it 'redirects to the phrase' do
        phrase = Phrase.create! valid_attributes
        put :update, {:id => phrase.to_param, :phrase => valid_attributes}, valid_session
        expect(response).to redirect_to(phrase)
      end
    end

    context 'with invalid params' do
      it 'assigns the phrase as @phrase' do
        phrase = Phrase.create! valid_attributes
        put :update, {:id => phrase.to_param, :phrase => invalid_attributes}, valid_session
        expect(assigns(:phrase)).to eq(phrase)
      end

      it "re-renders the 'edit' template" do
        phrase = Phrase.create! valid_attributes
        put :update, {:id => phrase.to_param, :phrase => invalid_attributes}, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested phrase' do
      phrase = Phrase.create! valid_attributes
      expect {
        delete :destroy, {:id => phrase.to_param}, valid_session
      }.to change(Phrase, :count).by(-1)
    end

    it 'redirects to the phrases list' do
      phrase = Phrase.create! valid_attributes
      delete :destroy, {:id => phrase.to_param}, valid_session
      expect(response).to redirect_to(phrases_url)
    end
  end

end
