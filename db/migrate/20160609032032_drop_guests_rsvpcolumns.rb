class DropGuestsRsvpcolumns < ActiveRecord::Migration
  def change
    remove_column :guests, :attending
    remove_column :guests, :food_preference
  end
end
