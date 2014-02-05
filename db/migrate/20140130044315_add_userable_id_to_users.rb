class AddUserableIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :userable_id, :integer
  end
end
