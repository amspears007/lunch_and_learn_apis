require "rails_helper"

RSpec.describe "Add a new favorite " do
  before(:each) do
    @user = User.create!(name: "max", email: "max_dog@ruffruff.com", password: "treats123", password_confirmation: "treats123" )
  end
  describe "happy paths" do
    it "can add recipes to a list of favorites for a particular user" do

      user_params = {
        "api_key": @user.api_key,
        "country": "thailand",
        "recipe_link": "https://www.tastingtable.com/.....",
        "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
        }

        post "/api/v1/favorites", params: user_params

        expect(response).to be_successful
        expect(response.status).to eq(201)
        favorite = JSON.parse(response.body, symbolize_names: true)
# require 'pry'; binding.pry
        expect(favorite).to be_a(Hash)
        expect(favorite).to have_key(:success)
        expect(favorite[:success]).to eq("Favorite added successfully")
      end


      it "SAD PATH returns an error if the API key is invalid" do

        user_params = {
          "api_key": "101010101",
          "country": "thailand",
          "recipe_link": "https://www.tastingtable.com/.....",
          "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
        }

        post "/api/v1/favorites", params: user_params

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        no_favorite = JSON.parse(response.body, symbolize_names: true)

        expect(no_favorite).to be_a(Hash)
        expect(no_favorite).to have_key(:error)
        expect(no_favorite[:error]).to be_a(String)
        expect(no_favorite[:error]).to eq("Invalid API key")
      end
    end
  end