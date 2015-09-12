require "rails_helper"

RSpec.describe StudiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/studies").to route_to("studies#index")
    end

    it "routes to #new" do
      expect(:get => "/studies/new").to route_to("studies#new")
    end

    it "routes to #show" do
      expect(:get => "/studies/1").to route_to("studies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/studies/1/edit").to route_to("studies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/studies").to route_to("studies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/studies/1").to route_to("studies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/studies/1").to route_to("studies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/studies/1").to route_to("studies#destroy", :id => "1")
    end

  end
end
