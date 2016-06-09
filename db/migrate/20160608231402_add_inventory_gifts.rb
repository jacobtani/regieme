class AddInventoryGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :desired_quantity, :integer, default: 0
    add_column :gifts, :remainder_available, :integer, default: 0
  end
end
