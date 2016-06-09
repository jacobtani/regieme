class AddGiftDetaeils < ActiveRecord::Migration
  def change
    add_column :gifts, :website_link, :text
    add_column :gifts, :category, :string
  end
end
