class VideoFacade

  def self.get_one_video(country)
    response = VideoService.get_videos_by_country(country)
    first_video = response[:items].map do |video|
      Video.new(video)
    end.first
  end
end
