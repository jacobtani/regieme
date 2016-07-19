class UpdateGifts < ActiveRecord::Migration
  def change
    remove_column :gifts, :price
    add_column :gifts, :price, :float, default: 0
  end
end
