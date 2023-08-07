class Api::V1::AirQualityController <ApplicationController
  def search
    city = CountryFacade.get_capital(params[:country])
    air_quality = AirQualityFacade.get_air_quality(city)
    # render json: air_quality
    render json: AirQualitySerializer.new(air_quality)

    # require 'pry'; binding.pry
  end
end