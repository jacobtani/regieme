class Rsvp < ActiveRecord::Base
  belongs_to :guest
  validates_presence_of :attending
  validates_presence_of :guest_id, :message => "not registered to attend the wedding"
  validates_presence_of :meal_preference, :if => 'attending == "Yes"'
  attr_accessor :full_name
end