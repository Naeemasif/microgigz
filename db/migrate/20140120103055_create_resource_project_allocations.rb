class CreateResourceProjectAllocations < ActiveRecord::Migration
  def change
    create_table :resource_project_allocations do |t|
      t.integer :resource_id
      t.integer :project_id
      t.timestamps
    end
  end
end
