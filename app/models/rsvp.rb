class Rsvp < ActiveRecord::Base
  belongs_to :guest
  validates :attending, :email, presence: true
  validates_presence_of :guest_id, :message => "Your name was not recognised - please enter your full name"
  validates_presence_of :main_meal_preference, :if => 'attending == "Yes"', :message => "You need to select a main meal preference from the dropdown"
  validates_presence_of :dessert_preference, :if => 'attending == "Yes"', :message => "You need to select a dessert preference from the dropdown"
  validates_uniqueness_of :guest_id, message: "You have already RSVPed to the wedding. If you need to alter this please message us on our Contact Us page"
  attr_accessor :full_name
end
