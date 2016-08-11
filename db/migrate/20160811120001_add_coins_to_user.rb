class AddCoinsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :coins, :integer, :default => 15
  end
end
