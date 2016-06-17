class Cg < ActiveRecord::Base
  validates_presence_of :gift_id, :item_name, :guest_names
end