class LearningResourceFacade
  def self.get_resources(country)
    video = VideoFacade.get_one_video(country)
    images = ImageFacade.get_images(country)

    LearningResource.new(country, video, images)
  end
end