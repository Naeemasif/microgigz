class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :resource_id
      t.string :technology
      t.integer :rating

      t.timestamps
    end
  end
end
