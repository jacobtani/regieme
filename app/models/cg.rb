# == Schema Information
#
# Table name: cgs
#
#  id          :integer          not null, primary key
#  guest_names :string
#  item_name   :string
#  gift_id     :integer          not null
#
class Cg < ActiveRecord::Base
  validates :guest_names, format: { with: /[a-zA-Z]/}, presence: true
  validates :contribution_amount, numericality: true, presence: true
end
