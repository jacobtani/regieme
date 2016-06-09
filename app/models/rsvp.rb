class Rsvp < ActiveRecord::Base
  belongs_to :guest
  validates_presence_of :attending, :meal_preference
  validates_presence_of :guest_id, :message => "not registered to attend the wedding"
  attr_accessor :first_name, :surname
end