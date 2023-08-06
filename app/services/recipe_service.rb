class RecipeService

  def self.all_recipes_by_country(country)
    get_url("/search?q=#{country}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("https://api.edamam.com") do |faraday|
    faraday.params["app_id"] = ENV["edamam_id"]
    faraday.params["app_key"] = ENV["edamam_key"]
    end
  end
end