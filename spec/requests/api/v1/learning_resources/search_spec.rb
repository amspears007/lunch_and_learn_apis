require "rails_helper"

RSpec.describe "Learning Resources Search Request" do
  describe "GET /api/v1/learning_resources/search" do
    xit "requests all the learning resources"do
    Videoservice.new
      get "/api/v1/learning_resources?country=thailand"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      recipe_result = JSON.parse(response.body, symbolize_names: true)
    end
  end
end