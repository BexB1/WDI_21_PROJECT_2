class ChangeDailyPostToDateTime < ActiveRecord::Migration[5.0]
  def change
    change_column :pledges, :daily_post, :datetime
  end
end
