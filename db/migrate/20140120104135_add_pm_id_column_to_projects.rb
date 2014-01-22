class AddPmIdColumnToProjects < ActiveRecord::Migration

  def up
    add_column :projects,:pm_id,:integer
  end

  def down
    remove_column :projects,:pm_id

  end
end
