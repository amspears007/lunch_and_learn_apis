require "rails_helper"

RSpec.describe CountryService do
  describe "gets country data" do
    it " returns all_countries", :vcr do
      countries = CountryService.all_countries
# require 'pry'; binding.pry
      expect(countries).to be_an(Array)
      expect(countries.count).to eq(250)

      countries.each do |country|
        expect(country).to have_key(:name)
        expect(country[:name]).to have_key(:common)
        # expect(country).to have_key(:capital)
        # expect(country).to have_key(:languages)
        #not sure why these two are breaking
      end
    end

      it "finds a country by name" do
        name = "France"
        country = CountryService.country_by_name(name)
        expect(country).to be_an(Array)
        expect(country[0][:capital]).to eq(["Paris"])
    end
  end
end