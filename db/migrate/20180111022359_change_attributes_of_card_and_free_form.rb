class ChangeAttributesOfCardAndFreeForm < ActiveRecord::Migration[5.1]
  def change
    remove_column :cards, :argument_type
    remove_column :cards, :debate_id
    remove_column :cards, :topic_id
    remove_column :cards, :speech_id

    remove_column :free_forms, :card_id

    add_column :cards, :structured_argument?, :boolean
    add_column :cards, :argument_id, :integer

    add_column :free_forms, :response_id, :integer

  end
end
