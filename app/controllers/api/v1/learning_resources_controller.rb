class Api::V1::LearningResourcesController < ApplicationController
  def search
    if params[:country].empty?
      render json: { data: {} }
    else
      resources = LearningResourceFacade.get_resources(params[:country])
      render json: LearningResourceSerializer.new(resources)
    end
  end
end