class AirQualityFacade
  def self.get_air_quality(city)
    air_data = AirQualityService.quality_by_city(city)
    AirQuality.new(air_data, city)
  end
end