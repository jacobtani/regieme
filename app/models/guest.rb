# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  first_name :string
#  surname    :string
#  address    :text
#  email      :string
#

class Guest < ActiveRecord::Base
  has_one :rsvp
  validates_presence_of :first_name, :surname, :address

  def full_name
    "#{first_name} #{surname}"
  end

end
