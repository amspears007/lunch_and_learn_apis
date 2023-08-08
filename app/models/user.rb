class User < ApplicationRecord
  # before_create :generate_api_key

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates :password_digest, presence: true
  validates :api_key, uniqueness: true
  before_validation :generate_api_key

  has_secure_password
  has_many :favorites

  private

  def generate_api_key
    self.api_key = SecureRandom.base58(24)
  end
end