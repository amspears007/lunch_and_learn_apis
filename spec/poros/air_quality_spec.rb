require "rails_helper"

RSpec.describe AirQuality do
  describe "it creates an airquality object" do
      it "exists" do
        data = {
          overall_aqi: 25,
          "PM2.5": { concentration: 5.23 },
          CO: { concentration: 467.3 }
        }
        city = "Abuja"

        air_quality = AirQuality.new(data, city)
        expect(air_quality.city).to eq("Abuja")
        expect(air_quality.aqi).to eq(25)
        expect(air_quality.co_concentration).to eq(467.3)
        expect(air_quality.pm25_concentration).to eq(5.23)
      end
    end
  end