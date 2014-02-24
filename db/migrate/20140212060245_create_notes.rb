class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :noteable_id
      t.string :noteable_type
      t.text :description

      t.timestamps
    end
  end
end
