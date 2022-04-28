require 'rails_helper'

RSpec.describe "PriceHistories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/price_history/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/price_history/show"
      expect(response).to have_http_status(:success)
    end
  end

end
