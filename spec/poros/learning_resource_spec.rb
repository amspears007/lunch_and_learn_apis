require "rails_helper"

RSpec.describe LearningResource do
  describe "it creates a learningresource object" do
    it "exists",  :vcr do
      country = "usa"
      video = "america's funniest home videos"
      images = ["funny pic1", "funny pic2"]

      new_resource = LearningResource.new(country, video, images)

      expect(new_resource.country).to eq("usa")
      expect(new_resource.video).to eq("america's funniest home videos")
      expect(new_resource.images).to eq(["funny pic1", "funny pic2"])
      expect(new_resource.id).to eq("null")
    end
  end
end