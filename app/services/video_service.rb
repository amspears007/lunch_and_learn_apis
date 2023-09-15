class VideoService
  def self.conn
    conn = Faraday.new("https://www.googleapis.com") do |faraday|
    faraday.params["key"] = ENV["you_tube_key"]
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_videos_by_country(country)
    get_url("/youtube/v3/search?part=snippet&q=#{country}") do |faraday|
      # faraday.params['part']= 'snippet'
      # faraday.params['q']= country
    end
  end
end




