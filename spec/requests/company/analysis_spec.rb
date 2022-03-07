require 'rails_helper'

RSpec.describe "Company::Analyses", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/company/analysis/show"
      expect(response).to have_http_status(:success)
    end
  end

end
