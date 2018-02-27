require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  let(:valid_attributes) {
    {
      country_id: FactoryBot.create(:country).id,
      name: "A region"
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      country_id: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RegionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all regions as @regions" do
      region = Region.create! valid_attributes
      get :index, params: {}
      expect(assigns(:regions)).to eq([region])
    end
  end

  describe "GET #show" do
    it "assigns the requested region as @region" do
      region = Region.create! valid_attributes
      get :show, params: {id: region}
      expect(assigns(:region)).to eq(region)
    end
  end

  describe "GET #new" do
    it "assigns a new region as @region" do
      get :new, params: {}
      expect(assigns(:region)).to be_a_new(Region)
    end
  end

  describe "GET #edit" do
    it "assigns the requested region as @region" do
      region = Region.create! valid_attributes
      get :edit, params: {id: region}
      expect(assigns(:region)).to eq(region)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Region" do
        expect {
          post :create, params: {region: valid_attributes}
        }.to change(Region, :count).by(1)
      end

      it "assigns a newly created region as @region" do
        post :create, params: {region: valid_attributes}
        expect(assigns(:region)).to be_a(Region)
        expect(assigns(:region)).to be_persisted
      end

      it "redirects to the created region" do
        post :create, params: {region: valid_attributes}
        expect(response).to redirect_to(Region.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved region as @region" do
        post :create, params: {region: invalid_attributes}
        expect(assigns(:region)).to be_a_new(Region)
      end

      it "re-renders the 'new' template" do
        post :create, params: {region: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: "A new region"}
      }

      it "updates the requested region" do
        region = Region.create! valid_attributes
        put :update, params: {id: region, region: new_attributes}
        region.reload
        expect(region.name).to eq("A new region")
      end

      it "assigns the requested region as @region" do
        region = Region.create! valid_attributes
        put :update, params: {id: region, region: valid_attributes}
        expect(assigns(:region)).to eq(region)
      end

      it "redirects to the region" do
        region = Region.create! valid_attributes
        put :update, params: {id: region, region: valid_attributes}
        expect(response).to redirect_to(region)
      end
    end

    context "with invalid params" do
      it "assigns the region as @region" do
        region = Region.create! valid_attributes
        put :update, params: {id: region, region: invalid_attributes}
        expect(assigns(:region)).to eq(region)
      end

      it "re-renders the 'edit' template" do
        region = Region.create! valid_attributes
        put :update, params: {id: region, region: invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested region" do
      region = Region.create! valid_attributes
      expect {
        delete :destroy, params: {id: region}
      }.to change(Region, :count).by(-1)
    end

    it "redirects to the regions list" do
      region = Region.create! valid_attributes
      delete :destroy, params: {id: region}
      expect(response).to redirect_to(regions_url)
    end
  end

end
