class ImageFacade
  def self.get_images(country)
    images = ImageService.get_images_by_country(country)
    images[:results].map do |image|
      Image.new(image)
      require 'pry'; binding.pry
    end
  end
end