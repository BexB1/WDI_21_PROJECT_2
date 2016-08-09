class AddSponsorIdToPledges < ActiveRecord::Migration[5.0]
  def change
    add_column :pledges, :sponsor_id, :integer
  end
end
