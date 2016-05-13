class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
        t.string :first_name
        t.string :surname
        t.text :address
        t.boolean :attending
        t.integer :food_preference
    end
  end
end
