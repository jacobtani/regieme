class Cg < ActiveRecord::Base
  validates_presence_of :item_name, :guest_names
  attr_accessor :gift_id
end