class RenameCaptionGifts < ActiveRecord::Migration
  def change
    remove_column :gifts, :caption, :string
    add_column :gifts, :name, :string
  end
end
