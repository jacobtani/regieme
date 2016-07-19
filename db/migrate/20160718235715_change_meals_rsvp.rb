class ChangeMealsRsvp < ActiveRecord::Migration
  def change
    remove_column :rsvps, :meal_preference
    add_column :rsvps, :main_meal_preference, :string
    add_column :rsvps, :dessert_preference, :string 
  end
end
