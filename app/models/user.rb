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
#

class User < ActiveRecord::Base
  has_many :social_identities, dependent: :destroy
  validates :email, presence: true, uniqueness: true
end
