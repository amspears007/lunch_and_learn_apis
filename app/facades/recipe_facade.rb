class RecipeFacade
  def self.get_recipes(country)
    response = RecipeService.all_recipes_by_country(country)
    if response[:hits].empty?
      return []
    else
      recipes = response[:hits].map do |recipe|
        Recipe.new(recipe, country)
      end
    end
  end
end