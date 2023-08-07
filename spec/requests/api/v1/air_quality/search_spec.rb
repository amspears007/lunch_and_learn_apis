require "rails_helper"

RSpec.describe "Airquality search request" do
  describe "GET /api/v1/air_quality?country=country" do
    it "requests airquality of a specific city", :vcr do
      get "/api/v1/air_quality?country=Nigeria"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to be_a(Hash)
      expect(result[:data]).to be_a(Hash)

      # expect(result).to have_key([:data])
      expect(result[:data][:id]).to eq(nil)
      expect(result[:data][:type]).to eq("air_quality")
      expect(result[:data][:attributes]).to be_a(Hash)
      expect(result[:data][:attributes][:aqi]).to be_a(Integer)
      expect(result[:data][:attributes][:aqi]).to be_a(Integer)
      expect(result[:data][:attributes][:pm25_concentration]).to be_a(Float)
      expect(result[:data][:attributes][:co_concentration]).to be_a(Float)




      # require 'pry'; binding.pry
      # expect(result[:data]).to have_key([:type])
      # expect(result[:data]).to have_key([:attributes])
      # expect(result[:data][:attributes]).to have_key([:aqi])
      # expect(result[:data][:attributes]).to have_key([:pm25_concentration])
      # expect(result[:data][:attributes]).to have_key([:co_concentration])
    end
  end
end
