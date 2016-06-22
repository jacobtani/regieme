# == Schema Information
#
# Table name: gifts
#
#  id                  :integer          not null, primary key
#  description         :text             not null
#  guest_id            :integer
#  desired_quantity    :integer          default(0)
#  remainder_available :integer          default(0)
#  website_link        :text
#  category_id         :integer
#  price               :float            default(0.0)
#  name                :string
#

class Gift < ActiveRecord::Base
  validates_presence_of :name, :description, :price
  validates :price, :numericality => { :greater_than => 0 }
end
