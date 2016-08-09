class AddDailyPostToPledge < ActiveRecord::Migration[5.0]
  def change
    add_column :pledges, :daily_post, :string
  end
end
