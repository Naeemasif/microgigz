class AddStatusStringClients < ActiveRecord::Migration
  def up
    add_column :clients,:status,:string
  end

  def down
    remove_column :clients,:status
  end
end
