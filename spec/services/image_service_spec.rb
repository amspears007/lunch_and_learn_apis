require "rails_helper"

RSpec.describe ImageService do
  describe "it gets images" do
    it "gets imagesfrom a specific country", :vcr do
      images = ImageService.get_images_by_country("laos")
      expect(images).to be_a(Hash)
      expect(images[:results].count).to eq(10)
      expect(images[:results]).to be_an(Array)

      images[:results]. map do |image|
        expect(image[:description]).to be_a(String)
        expect(image[:urls]).to be_a(Hash)
        expect(image[:urls][:raw]).to be_a(String)
      end
    end
  end
end