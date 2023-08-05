require "rails_helper"

RSpec.describe RecipeFacade do
  it "returns an array of recipe objects" do
    recipes = RecipeFacade.get_recipes("thailand")

    expect(recipes).to be_an(Array)
    expect(recipes.count).to eq(10)
    expect(recipes.first).to be_a(Recipe)
    expect(recipes.first.title).to be_a(String)
    expect(recipes.first.url).to be_a(String)
    expect(recipes.first.image).to be_a(String)
    expect(recipes.first.country).to eq('thailand')
  end
end