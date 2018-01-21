class AddCardIdToFreeForm < ActiveRecord::Migration[5.1]
  def change
    add_column :free_forms, :card_id, :integer
  end
end
