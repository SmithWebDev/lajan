require 'rails_helper'

RSpec.describe "Analyses", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/analysis/index"
      expect(response).to have_http_status(:success)
    end
  end

end
