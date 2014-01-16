class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.boolean :status
      t.string :company_name

      t.timestamps
    end
  end
end
