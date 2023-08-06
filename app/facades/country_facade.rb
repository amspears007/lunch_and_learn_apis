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
end