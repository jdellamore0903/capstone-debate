class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :citation_id, :integer
  end
end
