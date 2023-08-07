class CountryService
  def self.conn
    Faraday.new("https://restcountries.com")
  end

  def self.all_countries
    response = conn.get("v3.1/all")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.country_by_name(name)
    response = conn.get("v3.1/name/#{name}")
    JSON.parse(response.body, symbolize_names: true)
  end
end