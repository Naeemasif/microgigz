class AddUserableTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :userable_type, :string
  end
end
