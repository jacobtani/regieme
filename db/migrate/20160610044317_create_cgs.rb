class CreateCgs < ActiveRecord::Migration
  def change
    create_table :cgs do |t|
      t.string :guest_names
      t.decimal :contribution_amount
    end
  end
end
