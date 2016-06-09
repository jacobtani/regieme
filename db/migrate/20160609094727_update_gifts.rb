class UpdateGifts < ActiveRecord::Migration
  def change
    remove_column :gifts, :gift_image_file_name
    remove_column :gifts, :gift_image_file_size
    remove_column :gifts, :gift_image_content_type
    remove_column :gifts, :gift_image_updated_at
    remove_column :gifts, :price
    add_column :gifts, :price, :float, default: 0
  end
end
