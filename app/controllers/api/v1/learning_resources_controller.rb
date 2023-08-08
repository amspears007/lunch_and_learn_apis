class Api::V1::LearningResourcesController < ApplicationController
  def search
    resources = LearningResourceFacade.new.get_resources(params[:country])
    render json: LearningResourceSerializer.new(resources)
  end
end