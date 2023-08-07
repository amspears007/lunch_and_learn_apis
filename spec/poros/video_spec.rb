require "rails_helper"

RSpec.describe Video do
  describe "it creates video objects" do
    it "exists" do
      attributes = {
        snippet: {
          title: "Amy's Deliciousness"
        },
        id: {
          videoId: "a4a4a4a4a4"
        }
      }
      country = "usa"

      new_video = Video.new(attributes, country)

      # expect(new_video.country).to eq( "usa")
      expect(new_video.title).to eq("Amy's Deliciousness")
      expect(new_video.video_id).to eq("a4a4a4a4a4")
    end
  end
end