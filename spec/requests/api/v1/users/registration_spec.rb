require "rails_helper"

RSpec.describe "user registration" do
  describe "it creates a user" do
    it "it returns a user with name, email and api_key" do
    user_params = {

      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "treats4lyf"
    }

    # headers = { 'CONTENT_TYPE' => 'application/json' } can't remember what this line is for
    post "/api/v1/users", params: user_params, as: :json

      expect(response).to be_successful
      expect(response.status).to eq(201)
      user = JSON.parse(response.body, symbolize_names: true)
      expect(user).to be_a(Hash)
      expect(user).to have_key(:data)
      expect(user[:data]).to be_a(Hash)
      expect(user[:data]).to have_key(:type)
      expect(user[:data][:type]).to eq("user")
      expect(user[:data][:id]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:name)
      expect(user[:data][:attributes][:name]).to be_a(String)
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:api_key)
      expect(user[:data][:attributes][:api_key]).to be_a(String)
    end


    it "SAD PATH an error message should be returned if the email is not unique" do
      @user = User.create!(name: "max", email: "max_dog@ruffruff.com", password: "treats123", password_confirmation: "treats123" )

      new_user = {
        "name": "Odell",
        "email": "max_dog@ruffruff.com",
        "password": "treats4lyf",
        "password_confirmation": "treats4lyf"
      }

      post "/api/v1/users", params: new_user
      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response).to be_a(Hash)
      expect(json_response[:email]).to eq(["has already been taken"])
    end

    it "SAD PATH an error message should be returned if password confirmation does not match" do
      new_user = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf",
        "password_confirmation": "123"
      }

      post "/api/v1/users", params: new_user
      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response).to be_a(Hash)
      expect(json_response[:password_confirmation]).to eq(["doesn't match Password"])
    end
  end
end