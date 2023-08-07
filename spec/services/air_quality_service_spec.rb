require "rails_helper"

RSpec.describe AirQualityService do
  describe "it finds airquality by city" do
    it "returns data about air quality" do
    air = AirQualityService.quality_by_city("paris")
# require 'pry'; binding.pry
    expect(air).to be_a(Hash)
    expect(air).to have_key(:CO)
    expect(air).to have_key(:overall_aqi)
    expect(air[:CO]).to be_a(Hash)
    expect(air[:CO][:concentration]).to be_a(Float)
    expect(air[:"PM2.5"]).to be_a(Hash)
    expect(air[:"PM2.5"][:concentration]).to be_a(Float)
    expect(air[:overall_aqi]).to eq(84)
    end
  end
end
