class AddAvailabilityColumn < ActiveRecord::Migration
  def up
    add_column :resources,:availability,:string

  end

  def down
    remove_column :resources,:availability
  end
end
