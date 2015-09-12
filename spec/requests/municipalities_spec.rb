require 'rails_helper'

RSpec.describe "Municipalities", type: :request do
  describe "GET /municipalities" do
    it "works! (now write some real specs)" do
      get municipalities_path
      expect(response).to have_http_status(200)
    end
  end
end
