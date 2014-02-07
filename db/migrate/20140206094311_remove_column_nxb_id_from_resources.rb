class RemoveColumnNxbIdFromResources < ActiveRecord::Migration
  def up
    remove_column :resources,:nxb_id
  end

  def down
    add_column :resources,:nxb_id,:string
  end
end
