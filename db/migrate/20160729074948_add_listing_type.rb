class AddListingType < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :mytype, :string
    add_column :listings, :image_url, :string
  end
end
