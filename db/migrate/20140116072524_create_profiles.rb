class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.string :telephone
      t.string :profileable_type
      t.integer :profileable_id

      t.timestamps
    end
  end
end
