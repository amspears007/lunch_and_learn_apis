require "rails_helper"

RSpec.describe ImageFacade do
  it "returns an array of recipe objects", :vcr  do
    images = ImageFacade.get_images("thailand")
    expect(images).to be_an(Array)
    expect(images.count).to eq(10)
    expect(images.first).to be_a(Image)
  end
end