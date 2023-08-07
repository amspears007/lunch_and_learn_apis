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

      expect(result[:data][:id]).to eq(nil)
      expect(result[:data][:type]).to eq("air_quality")
      expect(result[:data][:attributes]).to be_a(Hash)
      expect(result[:data][:attributes][:aqi]).to be_a(Integer)
      expect(result[:data][:attributes][:aqi]).to be_a(Integer)
      expect(result[:data][:attributes][:pm25_concentration]).to be_a(Float)
      expect(result[:data][:attributes][:co_concentration]).to be_a(Float)
      expect(result[:data][:attributes][:city]).to be_a(String)
      expect(result[:data][:attributes][:city]).to eq("Abuja")
    end

    it "requests airquality of a different city", :vcr do
      get "/api/v1/air_quality?country=France"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to be_a(Hash)
      expect(result[:data]).to be_a(Hash)

      expect(result[:data][:id]).to eq(nil)
      expect(result[:data][:type]).to eq("air_quality")
      expect(result[:data][:attributes]).to be_a(Hash)
      expect(result[:data][:attributes][:aqi]).to be_a(Integer)
      expect(result[:data][:attributes][:aqi]).to be_a(Integer)
      expect(result[:data][:attributes][:pm25_concentration]).to be_a(Float)
      expect(result[:data][:attributes][:co_concentration]).to be_a(Float)
      expect(result[:data][:attributes][:city]).to be_a(String)
      expect(result[:data][:attributes][:city]).to eq("Paris")
    end
  end
end
