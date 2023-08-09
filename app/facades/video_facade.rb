class VideoFacade

  def self.get_one_video(country)
    response = VideoService.get_videos_by_country(country)
    # if response[:items].nil?
    #   video = {}
    # else
    # require 'pry'; binding.pry
      video = response[:items].first
      Video.new(video)
    # end
  end
end
