require "rails_helper"

RSpec.describe RecipeService do
  describe "it gets all recipes" do
    it "gets recipes from a specific country", :vcr do
      recipes = RecipeService.all_recipes_by_country("thailand")
      expect(recipes[:hits]).to be_an(Array)
      expect(recipes[:hits].count).to eq(10)

      recipes[:hits].each do |recipe|
        expect(recipe[:recipe]).to have_key(:uri)
        expect(recipe[:recipe]).to have_key(:label)
        expect(recipe[:recipe]).to have_key(:image)


        # require 'pry'; binding.pry

      end
    end
  end
end