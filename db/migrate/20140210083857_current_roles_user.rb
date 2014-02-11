class CurrentRolesUser < ActiveRecord::Migration
  def up
    add_column :user_roles ,:status, :string
  end

  def down
    remove_column :user_roles ,:status
  end
end
