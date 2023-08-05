require "rails_helper"

RSpec.describe "Recipes index request" do
  it "requests all the recipes" do
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
end