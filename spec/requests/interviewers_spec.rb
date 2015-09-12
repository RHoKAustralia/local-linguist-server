require 'rails_helper'

RSpec.describe "Interviewers", type: :request do
  describe "GET /interviewers" do
    it "works! (now write some real specs)" do
      get interviewers_path
      expect(response).to have_http_status(200)
    end
  end
end
