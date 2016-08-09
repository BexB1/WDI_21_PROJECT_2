class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :pledges, :daily_post, "date USING daily_post::date"
  end
end
