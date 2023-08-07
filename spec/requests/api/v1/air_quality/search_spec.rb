require "rails_helper"

RSpec.describe "Airquality search request" do
  describe "GET /api/v1/air_quality?country=country" do
    it "requests airquality of a specific city" do
      get "/api/v1/air_quality?country=Nigeria"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      result = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
