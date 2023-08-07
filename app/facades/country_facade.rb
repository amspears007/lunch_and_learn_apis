class CountryFacade
  def self.get_country(country)
    if country.nil?
    all_names = CountryService.all_countries.map do |country|
      country[:name][:common]
    end
      all_names.sample
    else
      country
    end
  end

  def self.get_capital(country)
    capital = CountryService.country_by_name(country)
    capital[0][:capital][0]
  end
end