class AddAttachmentGiftImageToGifts < ActiveRecord::Migration
  def self.up
    change_table :gifts do |t|
      t.attachment :gift_image
    end
  end

  def self.down
    remove_attachment :gifts, :gift_image
  end
end
