class AddGiftidCg < ActiveRecord::Migration
  def change
    add_reference :cgs, :gift, index: true, null: false   
  end
end
