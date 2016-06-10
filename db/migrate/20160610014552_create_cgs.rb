class CreateCgs < ActiveRecord::Migration
  def change
    create_table :cgs do |t|
      t.string :guest_names
      t.string :item_name
    end
  end
end
