require "rails_helper"

RSpec.describe Image do
  describe "it creates image objects" do
    it "exists" do
      data = {
        description: "rubber chicken",
        urls: {
          raw: "https://funtime.com/search"
        }
      }

      new_image = Image.new(data)

      expect(new_image).to be_a(Image)
      expect(new_image.alt_tag).to eq("rubber chicken")
      expect(new_image.url).to eq("https://funtime.com/search")
    end
  end
end