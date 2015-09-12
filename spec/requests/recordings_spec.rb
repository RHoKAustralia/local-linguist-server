require 'rails_helper'

RSpec.describe "Recordings", type: :request do
  describe "GET /recordings" do
    it "works! (now write some real specs)" do
      get recordings_path
      expect(response).to have_http_status(200)
    end
  end
end
