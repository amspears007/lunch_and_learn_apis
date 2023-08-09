class VideoFacade

  def self.get_one_video(country)
    response = VideoService.get_videos_by_country(country)
    if response[:items].empty?
      video = {}
    else
      video = response[:items].first
      Video.new(video)
    end
  end
end
