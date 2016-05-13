class Guest < ActiveRecord::Base
  enum food_preference: [:chicken, :steak, :salmon, :vegetarian]
  validates_presence_of :first_name, :surname, :address
end