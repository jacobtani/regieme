class Guest < ActiveRecord::Base
  has_one :rsvp
  validates_presence_of :first_name, :surname, :address

  def full_name
    "#{first_name} #{surname}"
  end

end