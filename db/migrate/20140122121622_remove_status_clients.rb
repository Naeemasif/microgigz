class RemoveStatusClients < ActiveRecord::Migration
  def up
    remove_column :clients,:status
  end

  def down
    add_column :clients,:status,:boolean
  end
end
