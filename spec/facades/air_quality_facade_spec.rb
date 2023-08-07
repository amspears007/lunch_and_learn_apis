require "rails_helper"

RSpec.describe AirQualityFacade do
  it "returns a single airquality object" do
    city = "paris"
    air = AirQualityFacade.get_air_quality(city)

  expect(air).to be_a(AirQuality)
  expect(air.aqi).to be_a(Integer)
  expect(air.city).to eq(city)
  expect(air.co_concentration).to be_a(Float)
  expect(air.pm25_concentration).to be_a(Float)
  end
end