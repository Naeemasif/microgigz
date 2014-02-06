class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.txt :description

      t.timestamps
    end
  end
end
