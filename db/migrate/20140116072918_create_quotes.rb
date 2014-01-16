class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :description
      t.integer :lead_id

      t.timestamps
    end
  end
end
