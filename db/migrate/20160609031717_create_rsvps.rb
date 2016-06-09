class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.boolean :attending, null: false
      t.string :meal_preference
      t.text :dietary_requirements
      t.references :guest, null: false, index: true
    end
  end
end
