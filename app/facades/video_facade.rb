class VideoFacade

  def self.get_one_video(country)
    response = VideoService.get_videos_by_country(country)
    # require 'pry'; binding.pry
    first_video = response[:items].map do |video|
      # require 'pry'; binding.pry
      Video.new(video)
    end.first
  end
end
