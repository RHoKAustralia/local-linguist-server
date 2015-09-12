require 'rails_helper'

RSpec.describe "Studies", type: :request do
  describe "GET /studies" do
    it "works! (now write some real specs)" do
      get studies_path
      expect(response).to have_http_status(200)
    end
  end
end
