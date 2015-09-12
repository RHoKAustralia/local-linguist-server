require 'rails_helper'

RSpec.describe "Words", type: :request do
  describe "GET /words" do
    it "works! (now write some real specs)" do
      get words_path
      expect(response).to have_http_status(200)
    end
  end
end
