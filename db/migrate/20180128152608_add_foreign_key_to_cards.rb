class AddForeignKeyToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :structured_argument_id, :integer
    remove_column :cards, :argument_id
  end
end
