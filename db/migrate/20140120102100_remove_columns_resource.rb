class RemoveColumnsResource < ActiveRecord::Migration
  def up
    remove_column :resources,:project_id
  end

  def down
    add_column  :resources,:project_id, :integer
  end
end
