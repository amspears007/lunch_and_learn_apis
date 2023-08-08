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
        added_recipe = JSON.parse(response.body, symbolize_names: true)

        expect(happy_response).to be_a(Hash)
      end
    end
  end