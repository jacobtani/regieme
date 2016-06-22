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
  validates_presence_of :gift_id, :item_name, :guest_names
end
