require "rails_helper"

RSpec.describe VideoFacade do
  it "returns a video"  do
    video = VideoFacade.get_one_video("thailand")

    expect(video).to be_an(Array)
  end
end
