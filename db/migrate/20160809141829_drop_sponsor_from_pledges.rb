class DropSponsorFromPledges < ActiveRecord::Migration[5.0]
  def change
    remove_column :pledges, :sponsor
  end
end
