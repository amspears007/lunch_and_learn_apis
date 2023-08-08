class Api::V1::LearningResourcesController < ApplicationController
  def search
    # country = params[:country]
    # video = VideoFacade.get_one_video(country)
    # images = ImageFacade.get_images(country)
    # # require 'pry'; binding.pry
    # render json: LearningResourcesSerializer.new(video)
    resources = LearningResourceFacade.new.get_resources(params[:country])
    render json: LearningResourceSerializer.new(resources)
  end
end