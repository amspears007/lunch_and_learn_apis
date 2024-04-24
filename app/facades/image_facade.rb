class ImageFacade
  def self.get_images(country)
    return [] if country.nil? || country.empty?

    images = ImageService.get_images_by_country(country)
    if images[:results]&.empty?
      return []
    else
      images[:results].map do |image|
        Image.new(image)
      end
    end
  end
end