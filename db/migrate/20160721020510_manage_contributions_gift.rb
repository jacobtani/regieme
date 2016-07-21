class ManageContributionsGift < ActiveRecord::Migration
  def change
    add_column :gifts, :remainder_contribution_required, :float, default: 0
  end
end
