# == Schema Information
#
# Table name: social_identities
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  uid        :string
#  provider   :string
#  raw_object :text
#

class SocialIdentity < ApplicationRecord
  belongs_to :user
  validates :uid, presence: true
  validates :provider, presence: true
end
