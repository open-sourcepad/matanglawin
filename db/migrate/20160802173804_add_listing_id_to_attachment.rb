class AddListingIdToAttachment < ActiveRecord::Migration[5.0]
  def change
    add_reference :attachments, :listing
  end
end
