class Contribution < ActiveRecord::Base
  validates :guest_names, format: { with: /[a-zA-Z]/}, presence: true
  validates :contribution_amount, numericality: true, presence: true
end
