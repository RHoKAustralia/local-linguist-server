require 'rails_helper'

RSpec.describe "Interviews", type: :request do
  describe "GET /interviews" do
    it "works! (now write some real specs)" do
      get interviews_path
      expect(response).to have_http_status(200)
    end
  end
end
