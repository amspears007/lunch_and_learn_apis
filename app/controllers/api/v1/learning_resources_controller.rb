class Api::V1::LearningResourcesController < ApplicationController
  def search
    resources = LearningResourceFacade.get_resources(params[:country])
    render json: LearningResourceSerializer.new(resources)
  end
end