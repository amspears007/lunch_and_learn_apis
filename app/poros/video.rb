class Video
  attr_reader :title, :video_id, :id

  def initialize(data)
    @title = data[:snippet][:title]
    @video_id = data[:id][:videoId]
    @id = "null"
  end
end