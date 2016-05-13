class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :caption, null: false
      t.text :description, null: false
      t.float :price
      t.string :shop_name
      t.references :guest, index: true
    end
  end
end
