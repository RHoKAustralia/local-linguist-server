require 'rails_helper'

RSpec.describe LanguagesController, type: :controller do

  let(:valid_attributes) { { name: 'Deutch', language_code: 'de' } }
  let(:invalid_attributes) { { name: nil, language_code: nil } }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all languages as @languages' do
      language = Language.create! valid_attributes
      get :index, params: {}
      expect(assigns(:languages)).to eq([language])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested language as @language' do
      language = Language.create! valid_attributes
      get :show, params: {id: language}
      expect(assigns(:language)).to eq(language)
    end
  end

  describe 'GET #new' do
    it 'assigns a new language as @language' do
      get :new, params: {}
      expect(assigns(:language)).to be_a_new(Language)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested language as @language' do
      language = Language.create! valid_attributes
      get :edit, params: {id: language}
      expect(assigns(:language)).to eq(language)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Language' do
        expect {
          post :create, params: {language: valid_attributes}
        }.to change(Language, :count).by(1)
      end

      it 'assigns a newly created language as @language' do
        post :create, params: {language: valid_attributes}
        expect(assigns(:language)).to be_a(Language)
        expect(assigns(:language)).to be_persisted
      end

      it 'redirects to the created language' do
        post :create, params: {language: valid_attributes}
        expect(response).to redirect_to(Language.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved language as @language' do
        post :create, params: {language: invalid_attributes}
        expect(assigns(:language)).to be_a_new(Language)
      end

      it "re-renders the 'new' template" do
        post :create, params: {language:  invalid_attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { name: 'English' }
      }

      it 'updates the requested language' do
        language = Language.create! valid_attributes
        put :update, params: {id: language, language:  new_attributes}
        language.reload
        expect(language.name).to eq 'English'
      end

      it 'assigns the requested language as @language' do
        language = Language.create! valid_attributes
        put :update, params: {id: language, language:  valid_attributes}
        expect(assigns(:language)).to eq(language)
      end

      it 'redirects to the language' do
        language = Language.create! valid_attributes
        put :update, params: {id: language, language:  valid_attributes}
        expect(response).to redirect_to(language)
      end
    end

    context 'with invalid params' do
      it 'assigns the language as @language' do
        language = Language.create! valid_attributes
        put :update, params: {id: language, language:  invalid_attributes}
        expect(assigns(:language)).to eq(language)
      end

      it "re-renders the 'edit' template" do
        language = Language.create! valid_attributes
        put :update, params: {id: language, language:  invalid_attributes}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested language' do
      language = Language.create! valid_attributes
      expect {
        delete :destroy, params: {id: language}
      }.to change(Language, :count).by(-1)
    end

    it 'redirects to the languages list' do
      language = Language.create! valid_attributes
      delete :destroy, params: {id: language}
      expect(response).to redirect_to(languages_url)
    end
  end

end
