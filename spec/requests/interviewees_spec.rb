require 'rails_helper'

RSpec.describe "Interviewees", type: :request do
  describe "GET /interviewees" do
    it "works! (now write some real specs)" do
      get interviewees_path
      expect(response).to have_http_status(200)
    end
  end
end
