require "rails_helper"

RSpec.describe "Recipes index request" do
  it "requests all the recipes" do
    get "/api/v1/recipes?country=thailand"
    expect(response).to be_successful

    users = JSON.parse(response.body, symbolize_names: true)
  end
end