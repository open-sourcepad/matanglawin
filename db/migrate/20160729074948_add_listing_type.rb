class AddListingType < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :mytype, :string
  end
end
