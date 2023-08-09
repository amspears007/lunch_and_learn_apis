require "rails_helper"

RSpec.describe "Learning Resources Search Request" do
  describe "GET /api/v1/learning_resources/search" do
    it "requests all the learning resources", :vcr do
      get "/api/v1/learning_resources?country=thailand"

      expect(response).to be_successful
      expect(response.status).to eq(200)
    result = JSON.parse(response.body, symbolize_names: true)
      expect(result).to be_a(Hash)
      expect(result[:data][:type]).to eq("learning_resource")
      expect(result[:data][:id]).to eq("null")
      expect(result[:data][:attributes][:country]).to eq("thailand")
      expect(result[:data][:attributes][:images]).to be_an(Array)
      expect(result[:data][:attributes][:images].size).to be_a(Integer)
      expect(result[:data][:attributes][:images].size).to eq(10)
      expect(result[:data][:attributes][:images][0]).to have_key(:alt_tag)
      expect(result[:data][:attributes]).to have_key(:video)
      expect(result[:data][:attributes][:video]).to have_key(:video_id)
    end

    it "SAD PATH if no images are found, the image key should be an empty array", :vcr do
      get "/api/v1/learning_resources?country=genericcountry"

      expect(response).to be_successful

      sad = JSON.parse(response.body, symbolize_names: true)
      expect(sad).to have_key(:data)
      expect(sad[:data]).to have_key(:id)
      expect(sad[:data]).to have_key(:type)
      expect(sad[:data]).to have_key(:attributes)
      expect(sad[:data][:attributes]).to have_key(:country)
      expect(sad[:data][:attributes][:images]).to eq([])
      expect(sad[:data][:attributes][:images].empty?).to eq(true)
      expect(sad[:data][:attributes][:video]).to be_a(Hash)
    end

    it "returns an empty data hash when the country parameter is an empty string", :vcr do
      get "/api/v1/learning_resources?country="""

      expect(response).to be_successful

      sad = JSON.parse(response.body, symbolize_names: true)

      expect(sad).to be_a(Hash)
      expect(sad).to have_key(:data)
      expect(sad[:data]).to eq({})
    end
  end
end