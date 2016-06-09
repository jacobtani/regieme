class UpdateCategoryGifts < ActiveRecord::Migration
  def change
    remove_column :gifts, :category
    add_reference :gifts, :category
  end
end
