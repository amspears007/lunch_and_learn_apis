require "rails_helper"

RSpec.describe Video do
  describe "it creates video objects", :vcr do
    it "exists" do
      attributes = {
        snippet: {
          title: "Amy's Deliciousness"
        },
        id: {
          videoId: "a4a4a4a4a4"
        }
      }

      new_video = Video.new(attributes)

      expect(new_video.title).to eq("Amy's Deliciousness")
      expect(new_video.video_id).to eq("a4a4a4a4a4")
    end
  end
end