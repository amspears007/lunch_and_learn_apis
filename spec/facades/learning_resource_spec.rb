require "rails_helper"

RSpec.describe LearningResourceFacade do
  it "returns a learning resource object"  do
    resources =  LearningResourceFacade.get_resources("thailand")

    expect(resources).to be_a(LearningResource)
    expect(resources.id).to eq(nil)
    expect(resources.images).to be_an(Array)
    expect(resources.images.size).to eq(10)
    expect(resources.country).to eq("thailand")
  end
end
