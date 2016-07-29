# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string
#  last_name          :string
#  email              :string
#  encrypted_password :string
#  is_active          :boolean          default(TRUE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  auth_token         :string
#

class User < ApplicationRecord
  has_many :social_identities, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :auth_token, presence: true, uniqueness: true
  before_validation :generate_auth_token, unless: :auth_token?
  has_many :listings, dependent: :destroy

  def full_name
    self.first_name + " " + self.last_name
  end

  private

  def generate_auth_token
    loop do
      self.auth_token = SecureRandom.hex
      break if User.where(auth_token: self.auth_token).empty?
    end
  end
end
