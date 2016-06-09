class Gift < ActiveRecord::Base
  validates_presence_of :caption, :description, :price
end