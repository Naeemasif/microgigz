class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :title
      t.text :description
      t.integer :client_id

      t.timestamps
    end
  end
end
