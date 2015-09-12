require "rails_helper"

RSpec.describe IntervieweesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/interviewees").to route_to("interviewees#index")
    end

    it "routes to #new" do
      expect(:get => "/interviewees/new").to route_to("interviewees#new")
    end

    it "routes to #show" do
      expect(:get => "/interviewees/1").to route_to("interviewees#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/interviewees/1/edit").to route_to("interviewees#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/interviewees").to route_to("interviewees#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/interviewees/1").to route_to("interviewees#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/interviewees/1").to route_to("interviewees#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/interviewees/1").to route_to("interviewees#destroy", :id => "1")
    end

  end
end
