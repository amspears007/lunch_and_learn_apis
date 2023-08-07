require "rails_helper"

RSpec.describe Recipe do
  describe "it creates recipe objects" do
    it "exists" do
      attributes = {
        recipe: {
          label: "Amy's Deliciousness",
          url: "https://www.amy's eats.com",
          image: "funny food image"
        }
      }
      country = "usa"

      new_recipe = Recipe.new(attributes, country)
      expect(new_recipe.country).to eq("usa")
      expect(new_recipe.title).to eq("Amy's Deliciousness")
      expect(new_recipe.url).to eq("https://www.amy's eats.com")
      expect(new_recipe.image).to eq("funny food image")

    end
  end
end