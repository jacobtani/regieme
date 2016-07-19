class AddEmailNulldefaultGuests < ActiveRecord::Migration
  def change
    remove_column :guests, :email 
    add_column :guests, :email, :string, :default => nil
  end
end
