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
    post "/api/v1/users", params: user_params

    expect(response).to be_successful
    expect(response.status).to eq(201)
    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to be_a(Hash)
    end
  end
end