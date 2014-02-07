class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.datetime :start_date
      t.string :pm_name
      t.string :status
      t.integer :lead_id
      t.integer :client_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
