require "rails_helper"

RSpec.describe "Favorites Index" do
  before(:each) do
    @user = User.create!(name: "max", email: "max_dog@ruffruff.com", password: "treats123", password_confirmation: "treats123" )
    @favorite1 = Favorite.create!(user_id: @user.id, country: 'thailand',
      recipe_title: 'Crab Fried Rice (Khaao Pad Bpu)',
      recipe_link: 'https://www.tastingtable.com/fried-rice-is-delicious.html')
    @favorite2 = Favorite.create!(user_id: @user.id, country: "egypt", recipe_title: "Recipe: Egyptian Tomato Soup", recipe_link: "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....")
  end

  describe "happy path" do
    it "returns a users favorite recipes", :vcr do
      get "/api/v1/favorites?api_key=#{@user.api_key}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      favorite = JSON.parse(response.body, symbolize_names: true)

      expect(favorite).to have_key(:data)
      expect(favorite[:data]).to be_an(Array)
      expect(favorite[:data].size).to eq(2)
      expect(favorite[:data].first[:id]).to be_a(String)
      expect(favorite[:data].first[:type]).to eq("favorite")
      expect(favorite[:data].first[:attributes]).to be_a(Hash)
      expect(favorite[:data].first[:attributes][:country]).to be_a(String)
      expect(favorite[:data].first[:attributes][:recipe_link]).to be_a(String)
      expect(favorite[:data].first[:attributes][:recipe_title]).to be_a(String)
    end
  end

  describe "sad path" do
    it "returns an error message when users api isn't valid", :vcr do
      get "/api/v1/favorites?api_key=141414"

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to be_a(Hash)
      expect(error).to have_key(:error)
      expect(error[:error]).to eq('Invalid API key')
    end
  end
end