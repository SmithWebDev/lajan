require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /profile" do
    it "returns http success" do
      get "/user/profile"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /accounts" do
    it "returns http success" do
      get "/user/accounts"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /connections" do
    it "returns http success" do
      get "/user/connections"
      expect(response).to have_http_status(:success)
    end
  end

end
