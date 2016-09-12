# == Schema Information
#
# Table name: cgs
#
#  id                  :integer          not null, primary key
#  guest_names         :string
#  contribution_amount :decimal(, )
#

class Cg < ActiveRecord::Base
  validates :guest_names, format: { with: /[a-zA-Z]/}, presence: true
  validates :contribution_amount, numericality: true, presence: true
end
