require "rails_helper"

describe "Recipes index request" do
  it "requests all the recipes" do
    get "/api/v1/recipes?country=thailand"
    get api_v1_users_path
    expect(response).to be_successful

    users = JSON.parse(response.body, symbolize_names: true)
  end
end