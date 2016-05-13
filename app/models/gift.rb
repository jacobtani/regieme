class Gift < ActiveRecord::Base
  validates_presence_of :caption, :description
end