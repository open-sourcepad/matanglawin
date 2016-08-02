# == Schema Information
#
# Table name: attachments
#
#  id                 :integer          not null, primary key
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  listing_id         :integer
#

class Attachment < ApplicationRecord
  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment :image, presence: true, content_type: {content_type: ["image/jpeg", "image/gif", "image/png"]}, size: { in: 0..10.megabytes }

  belongs_to :listing
end
