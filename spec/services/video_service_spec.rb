require "rails_helper"

RSpec.describe VideoService do
  describe "it gets all videos" do
    it "gets videos from a specific country" do
      videos = VideoService.get_videos_by_country("thailand")
      # expect(recipes[:hits]).to be_an(Array)
      # expect(recipes[:hits].count).to eq(10)
    end
  end
end