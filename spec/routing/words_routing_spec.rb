require "rails_helper"

RSpec.describe WordsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/words").to route_to("words#index")
    end

    it "routes to #new" do
      expect(:get => "/words/new").to route_to("words#new")
    end

    it "routes to #show" do
      expect(:get => "/words/1").to route_to("words#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/words/1/edit").to route_to("words#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/words").to route_to("words#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/words/1").to route_to("words#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/words/1").to route_to("words#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/words/1").to route_to("words#destroy", :id => "1")
    end

  end
end
