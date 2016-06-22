# == Schema Information
#
# Table name: rsvps
#
#  id                   :integer          not null, primary key
#  meal_preference      :string
#  dietary_requirements :text
#  guest_id             :integer          not null
#  attending            :string           not null
#

class Rsvp < ActiveRecord::Base
  belongs_to :guest
  validates_presence_of :attending
  validates_presence_of :guest_id, :message => "Your name was not recognised - please enter your full name"
  validates_presence_of :meal_preference, :if => 'attending == "Yes"', :message => "You need to select a Meal Preference from the dropdown"
  attr_accessor :full_name
  validates_uniqueness_of :guest_id, message: "You have already RSVPed to the wedding. If you need to alter this please message us on our Contact Us page"
end
