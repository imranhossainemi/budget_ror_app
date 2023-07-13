require 'rails_helper'

RSpec.describe "BudgetTypes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/budget_types/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/budget_types/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/budget_types/new"
      expect(response).to have_http_status(:success)
    end
  end

end
