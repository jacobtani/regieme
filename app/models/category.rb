# == Schema Information
#
# Table name: categories
#
#  id   :integer          not null, primary key
#  name :string           not null
#

class Category < ActiveRecord::Base
  validates_presence_of :name
end
