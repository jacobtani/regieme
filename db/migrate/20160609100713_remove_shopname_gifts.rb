class RemoveShopnameGifts < ActiveRecord::Migration
  def change
    remove_column :gifts, :shop_name
  end
end
