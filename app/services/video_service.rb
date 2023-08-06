class VideoService
  def self.conn
    conn = Faraday.new("https://www.googleapis.com") do |faraday|
    faraday.params["key"] = ENV["you_tube_key"]
  end
  # require 'pry'; binding.pry
  end

  def self.get_videos_by_country(country)
    response =conn.get('/youtube/v3/search') do |faraday|
      faraday.params['part']= 'snippet'
      faraday.params['q']= country
    end
    # require 'pry'; binding.pry
  end
end




