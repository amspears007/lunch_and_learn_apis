require "rails_helper"

RSpec.describe VideoFacade do
  it "returns a video object"  do
    video = VideoFacade.get_one_video("thailand")

    expect(video).to be_a(Video)
    expect(video.id).to eq("null")
    expect(video.title).to be_a(String)
    expect(video.video_id).to be_a(String)
  end
end
