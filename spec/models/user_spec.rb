require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it {should validate_presence_of(:password)}
    it { should validate_confirmation_of(:password) }
    it { should have_secure_password }
    # it { should validate_uniqueness_of(:api_key) }
    # it { should have_secure_token :api_key }
  end

  describe "relationships" do
    it { have_many :favorites }
  end
end