class AddNxbidToResource < ActiveRecord::Migration
  def change
    add_column :resources, :nxb_id, :string
  end
end
