require 'rails_helper'

RSpec.describe CountriesController, type: :controller do

  let(:valid_attributes) { { name: 'Australia'} }
  let(:invalid_attributes) { { name: nil } }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all countries as @countries' do
      country = Country.create! valid_attributes
      get :index, params: {}
      expect(assigns(:countries)).to eq([country])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested country as @country' do
      country = Country.create! valid_attributes
      get :show, params: {id:  country.to_param}
      expect(assigns(:country)).to eq(country)
    end
  end

  describe 'GET #new' do
    it 'assigns a new country as @country' do
      get :new, params: {}
      expect(assigns(:country)).to be_a_new(Country)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested country as @country' do
      country = Country.create! valid_attributes
      get :edit, params: {id:  country.to_param}
      expect(assigns(:country)).to eq(country)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Country' do
        expect {
          post :create, params: {country:  valid_attributes}
        }.to change(Country, :count).by(1)
      end

      it 'assigns a newly created country as @country' do
        post :create, params: {country:  valid_attributes}
        expect(assigns(:country)).to be_a(Country)
        expect(assigns(:country)).to be_persisted
      end

      it 'redirects to the created country' do
        post :create, params: {country:  valid_attributes}
        expect(response).to redirect_to(Country.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved country as @country' do
        post :create, params: {country:  invalid_attributes}
        expect(assigns(:country)).to be_a_new(Country)
      end

      it "re-renders the 'new' template" do
        post :create, params: {country:  invalid_attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { name: 'New Zealand' }
      }

      it 'updates the requested country' do
        country = Country.create! valid_attributes
        put :update, params: {id:  country.to_param, country:  new_attributes}
        country.reload
        expect(country.name).to eq 'New Zealand'
      end

      it 'assigns the requested country as @country' do
        country = Country.create! valid_attributes
        put :update, params: {id:  country.to_param, country:  valid_attributes}
        expect(assigns(:country)).to eq(country)
      end

      it 'redirects to the country' do
        country = Country.create! valid_attributes
        put :update, params: {id:  country.to_param, country:  valid_attributes}
        expect(response).to redirect_to(country)
      end
    end

    context 'with invalid params' do
      it 'assigns the country as @country' do
        country = Country.create! valid_attributes
        put :update, params: {id:  country.to_param, country:  invalid_attributes}
        expect(assigns(:country)).to eq(country)
      end

      it "re-renders the 'edit' template" do
        country = Country.create! valid_attributes
        put :update, params: {id:  country.to_param, country:  invalid_attributes}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested country' do
      country = Country.create! valid_attributes
      expect {
        delete :destroy, params: {id:  country.to_param}
      }.to change(Country, :count).by(-1)
    end

    it 'redirects to the countries list' do
      country = Country.create! valid_attributes
      delete :destroy, params: {id:  country.to_param}
      expect(response).to redirect_to(countries_url)
    end
  end
end
