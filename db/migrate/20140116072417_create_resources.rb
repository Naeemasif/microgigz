class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end
