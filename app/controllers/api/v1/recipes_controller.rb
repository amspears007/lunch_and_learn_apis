class Api::V1::RecipesController < ApplicationController
  def index
    country = CountryFacade.get_country(params[:country])
     recipes = RecipeFacade.get_recipes(country)
    render json: RecipeSerializer.new(recipes)
    # require 'pry'; binding.pry
  end
end