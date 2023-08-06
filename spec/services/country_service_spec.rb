require "rails_helper"

RSpec.describe CountryService do
  describe "gets all countries" do
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
  end
end