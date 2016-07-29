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
#  image_url   :string
#  user_id     :integer
#

class Listing < ApplicationRecord
  include PgSearch
  pg_search_scope :full_search,
                  against: [[:name,'A'], [:description,'B'], [:contact,'C']],
                  using: {
                    :tsearch => {:prefix => true, any_word: true}
                  }


  MYTYPE = %w(LOST FOUND)

  validates :name, presence: true
  validates :description, presence: true
  validates :contact, presence: true
  validates :lambdal_id, uniqueness: true, presence: :true
  validates :mytype, presence: true, inclusion: { in: MYTYPE}
  before_validation :generate_lambdal_id, unless: :lambdal_id?
  belongs_to :user

  private

  def generate_lambdal_id
    loop do
      self.lambdal_id = SecureRandom.hex
      break if Listing.where(lambdal_id: self.lambdal_id).empty?
    end
  end
end
