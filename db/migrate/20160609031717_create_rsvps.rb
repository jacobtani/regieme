class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :attending, null: false
      t.string :main_meal_preference
      t.string :dessert_preference
      t.text :dietary_requirements
      t.references :guest, null: false, index: true
      t.string :email, null: false
    end
  end
end
