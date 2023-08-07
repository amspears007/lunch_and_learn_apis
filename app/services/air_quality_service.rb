class AirQualityService

  def self.quality_by_city(city)
    get_url("/v1/airquality?city=#{city}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("https://api.api-ninjas.com") do |faraday|
    faraday.headers["X-Api-Key"] = ENV["api_ninjas"]
    end
  end
end
