class CreateSocialIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :social_identities do |t|
      t.references :user
      t.string :uid
      t.string :provider
      t.text :raw_object
    end
  end
end
