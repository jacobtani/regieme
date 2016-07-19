class AddRolesGuests < ActiveRecord::Migration
  def change
    add_column :guests, :age_category, :string
  end
end
