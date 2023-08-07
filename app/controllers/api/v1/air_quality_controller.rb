class Api::V1::AirQualityController <ApplicationController
  def search
    city = CountryFacade.get_capital(params[:country])
    require 'pry'; binding.pry
  end
end