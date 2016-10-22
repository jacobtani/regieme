class Guest < ActiveRecord::Base
  has_one :rsvp
  validates :first_name, :surname, :age_category, presence: true

  def full_name
    "#{first_name} #{surname}"
  end
end
