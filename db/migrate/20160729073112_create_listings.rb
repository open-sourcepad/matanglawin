class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.string :contact
      t.string :lambdal_id

      t.string :nickname
      t.date :birthday
      t.integer :age

      t.timestamps
    end
  end
end
