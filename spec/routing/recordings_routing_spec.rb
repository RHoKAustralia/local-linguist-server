require "rails_helper"

RSpec.describe RecordingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/recordings").to route_to("recordings#index")
    end

    it "routes to #new" do
      expect(:get => "/recordings/new").to route_to("recordings#new")
    end

    it "routes to #show" do
      expect(:get => "/recordings/1").to route_to("recordings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/recordings/1/edit").to route_to("recordings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/recordings").to route_to("recordings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/recordings/1").to route_to("recordings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/recordings/1").to route_to("recordings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/recordings/1").to route_to("recordings#destroy", :id => "1")
    end

  end
end
