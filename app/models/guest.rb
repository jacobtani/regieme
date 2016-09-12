# == Schema Information
#
# Table name: guests
#
#  id           :integer          not null, primary key
#  first_name   :string
#  surname      :string
#  address      :text
#  email        :string
#  age_category :string
#

class Guest < ActiveRecord::Base
  has_one :rsvp
  validates :first_name, :surname, :address, :age_category, presence: true

  def full_name
    "#{first_name} #{surname}"
  end

end
