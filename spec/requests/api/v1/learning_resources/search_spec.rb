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
  end
end