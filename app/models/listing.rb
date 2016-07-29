# == Schema Information
#
# Table name: listings
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  contact     :string
#  lambdal_id  :string
#  nickname    :string
#  birthday    :date
#  age         :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  mytype      :string
#

class Listing < ApplicationRecord
  MYTYPE = %w(LOST FOUND)

  validates :name, presence: true
  validates :description, presence: true
  validates :contact, presence: true
  validates :lambdal_id, uniqueness: true, presence: :true
  validates :mytype, presence: true, inclusion: { in: MYTYPE}

  before_validation :generate_lambdal_id, unless: :lambdal_id?

  private

  def generate_lambdal_id
    loop do
      self.lambdal_id = SecureRandom.uuid
      break if Listing.where(lambdal_id: self.lambdal_id).empty?
    end
  end
end
