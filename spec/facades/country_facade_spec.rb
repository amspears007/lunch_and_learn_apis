require "rails_helper"

RSpec.describe CountryFacade do
  describe "it returns a single country object" do
    it "will return the country name in params", :vcr  do
      single_country = CountryFacade.get_country("france")

      expect(single_country).to eq("france")
    end

    it "will return a random country if params are empty", :vcr  do
      single_country = CountryFacade.get_country(nil)

      expect(single_country).to be_a(String)
      expect(single_country.nil?).to eq(false)
    end
  end
end