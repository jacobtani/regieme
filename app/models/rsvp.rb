class Rsvp < ActiveRecord::Base
  validates :attending, :email, presence: true
  validates_presence_of :main_meal_preference, :if => 'attending == "Yes"', :message => "You need to select a main meal preference from the dropdown"
  validates_presence_of :dessert_preference, :if => 'attending == "Yes"', :message => "You need to select a dessert preference from the dropdown"
  attr_accessor :full_name
end
