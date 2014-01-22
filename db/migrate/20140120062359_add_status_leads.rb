class AddStatusLeads < ActiveRecord::Migration
  def up
    add_column :leads , :status, :string
  end

  def down
    remove_column :leads,:status
  end
end
