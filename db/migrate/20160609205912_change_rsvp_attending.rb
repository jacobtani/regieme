class ChangeRsvpAttending < ActiveRecord::Migration
  def change
    remove_column :rsvps, :attending
    add_column :rsvps, :attending, :string, null: false
  end
end