class AddIscontributableGift < ActiveRecord::Migration
  def change
    add_column :gifts, :contributable, :boolean, default: false
  end
end
