class AddStatsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :wins, :integer
    add_column :users, :losses, :integer
    add_column :users, :debates, :integer
    add_column :users, :votes, :integer
    add_column :users, :cards_created, :integer
  end
end
