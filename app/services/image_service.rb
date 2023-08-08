class ImageService
  def self.conn
    Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params["client_id"] = ENV['UNSPLASH_KEY']
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_images_by_country(country)
    get_url("/search/photos?query=#{country}&page=1")
  end
end