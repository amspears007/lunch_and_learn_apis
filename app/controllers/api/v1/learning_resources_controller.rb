class Api::V1::LearningResourcesController < ApplicationController
  def search
    country = params[:country]
    video = VideoFacade.get_one_video(country)
    # require 'pry'; binding.pry
    render json: LearningResourcesSerializer.new(video)
  end
end