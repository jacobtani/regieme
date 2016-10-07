class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.string :guest_names
      t.decimal :contribution_amount
    end
  end
end
