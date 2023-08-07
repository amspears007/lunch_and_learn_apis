require "rails_helper"

RSpec.describe "Recipes search request" do
  describe "GET /api/v1/recipes/search" do
    it "requests all the recipes", :vcr do
      get "/api/v1/recipes?country=thailand"
      expect(response).to be_successful
      expect(response.status).to eq(200)
      recipe_result = JSON.parse(response.body, symbolize_names: true)

      recipe_result[:data].map.each do |recipe|
        expect(recipe).to be_a(Hash)

        expect(recipe[:type]).to eq("recipe")
        expect(recipe).to have_key(:id)
        expect(recipe).to have_key(:attributes)
        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes]).to have_key(:url)
        expect(recipe[:attributes].keys).to eq([:title, :url, :country, :image, :id])
        expect(recipe[:attributes].keys.count).to eq(5)
      end
    end

    it "will return recipes with a random country" do
      get "/api/v1/recipes"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      recipe_result = JSON.parse(response.body, symbolize_names: true)

      recipe_result[:data].map.each do |recipe|
      expect(recipe).to be_a(Hash)
      expect(recipe[:type]).to eq("recipe")
      expect(recipe).to have_key(:id)
      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes].keys).to eq([:title, :url, :country, :image, :id])
      end
    end

    it "returns an empty array when no recipies match the given country", :vcr  do
      get "/api/v1/recipes?country=xyz"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      recipe_result = JSON.parse(response.body, symbolize_names: true)

      expect(recipe_result).to be_a(Hash)
      expect(recipe_result).to have_key(:data)
      expect(recipe_result[:data]).to eq([])
    end

    it "returns an empty array when the country inputted is an empty string", :vcr  do
      get "/api/v1/recipes?country="""

      expect(response).to be_successful
      expect(response.status).to eq(200)

      recipe_result = JSON.parse(response.body, symbolize_names: true)

      expect(recipe_result).to be_a(Hash)
      expect(recipe_result).to have_key(:data)
      expect(recipe_result[:data]).to eq([])
    end
  end
end