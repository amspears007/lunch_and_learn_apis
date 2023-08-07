require "rails_helper"

RSpec.describe VideoService do
  describe "it gets all videos" do
    it "gets videos from a specific country", :vcr do
      videos = VideoService.get_videos_by_country("thailand")
      first_video = videos[:items].first
      expect(videos).to be_a(Hash)
      expect(videos[:items]).to be_an(Array)
      expect(first_video).to have_key(:snippet)
      expect(first_video).to have_key(:id)
      expect(first_video[:snippet]).to have_key(:title)
      expect(first_video[:id]).to have_key(:videoId)
    end
  end
end