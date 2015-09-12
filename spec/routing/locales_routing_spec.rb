require "rails_helper"

RSpec.describe LocalesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/locales").to route_to("locales#index")
    end

    it "routes to #new" do
      expect(:get => "/locales/new").to route_to("locales#new")
    end

    it "routes to #show" do
      expect(:get => "/locales/1").to route_to("locales#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/locales/1/edit").to route_to("locales#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/locales").to route_to("locales#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/locales/1").to route_to("locales#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/locales/1").to route_to("locales#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/locales/1").to route_to("locales#destroy", :id => "1")
    end

  end
end
