class Video
  attr_reader :title, :video_id

  def initialize(data, country)
    @title = data[:snippet][:title]
    @video_id = data[:id][:videoId]
    @country = country
    @id = nil
  end
end