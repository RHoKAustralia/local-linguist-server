require 'rails_helper'

RSpec.describe "Locales", type: :request do
  describe "GET /locales" do
    it "works! (now write some real specs)" do
      get locales_path
      expect(response).to have_http_status(200)
    end
  end
end
