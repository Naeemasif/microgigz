class RemoveColumnProject < ActiveRecord::Migration
  def up
    remove_column :projects,:pm_name
    remove_column :projects,:resource_id
  end

  def down
    add_column :projects,:pm_name,:string
    add_column :projects,:resource_id,:integer
  end
end
