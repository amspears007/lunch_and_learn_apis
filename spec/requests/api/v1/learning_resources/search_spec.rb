require "rails_helper"

RSpec.describe "Learning Resources Search Request" do
  describe "GET /api/v1/learning_resources/search" do
    it "requests all the learning resources"do
      get "/api/v1/learning_resources?country=thailand"

      expect(response).to be_successful
      expect(response.status).to eq(200)
    video_result = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
    end
  end
end