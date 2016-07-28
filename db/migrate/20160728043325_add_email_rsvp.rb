class AddEmailRsvp < ActiveRecord::Migration
  def change
    add_column :rsvps, :email, :string, null: false
  end
end
