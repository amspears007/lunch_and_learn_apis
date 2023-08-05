class RecipeService
  def self.conn
    Faraday.new("https://api.edamam.com") do |faraday|
    faraday.params["app_id"] = ENV["app_id"]
    faraday.params["app_key"] = ENV["app_key"]
    end
  end

  def self.all_recipes_by_country(country)
    response = conn.get("/search?q=#{country}")

    JSON.parse(response.body, symbolize_names: true)
  end
end