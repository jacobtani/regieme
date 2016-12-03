class TidyupDatabase < ActiveRecord::Migration[5.0]
  def change
    drop_table :guests
    drop_table :contributions
    remove_column :rsvps, :guest_id
    add_column :rsvps, :guest_name, :string
  end
end
