require 'rails_helper'

RSpec.describe "DividendHistories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/dividend_history/index"
      expect(response).to have_http_status(:success)
    end
  end

end
