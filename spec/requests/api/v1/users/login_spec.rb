require "rails_helper"

RSpec.describe "user login" do
  before(:each) do
    @user = User.create!(name: "max", email: "max_dog@ruffruff.com", password: "treats123", password_confirmation: "treats123" )
  end

  describe "logs in a user with valid credentials" do
  it "happy path" do

    login = {
      "email": "max_dog@ruffruff.com",
      "password": "treats123"
    }
    post "/api/v1/sessions", params: login

    expect(response).to be_successful
    expect(response.status).to eq(200)
    user = JSON.parse(response.body, symbolize_names: true)
# require 'pry'; binding.pry
    expect(user).to be_a(Hash)
    expect(user).to have_key(:data)
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data][:type]).to be_a(String)
    expect(user[:data][:type]).to eq("user")
    expect(user[:data][:attributes]).to have_key(:name)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:email]).to be_a(String)
    expect(user[:data][:attributes][:api_key]).to be_a(String)
    end
  end
end