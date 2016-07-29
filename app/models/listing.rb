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
#

class Listing < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :contact, presence: true
  validates :lambdal_id, uniqueness: true, presence: :true
end
