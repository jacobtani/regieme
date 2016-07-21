class AddManagementCgs < ActiveRecord::Migration
  def change
    add_column :cgs, :contribution_amount, :float
    add_column :cgs, :quantity_contributed, :integer, default: 1
  end
end

