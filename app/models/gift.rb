class Gift < ActiveRecord::Base
  validates_presence_of :caption, :description
  has_attached_file :gift_image, :styles => {medium: "300x300>", :thumb => "100x100>"}
  validates_attachment_content_type :gift_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end