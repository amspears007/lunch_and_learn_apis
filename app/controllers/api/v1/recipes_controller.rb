class Api::V1::RecipesController < ApplicationController
  def index
    country = params[:country]
    render json: RecipeSerializer.new(country)
    # require 'pry'; binding.pry
  end
end