class ChangeFreeFormsForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_column :free_forms, :speech_id, :integer
    remove_column :free_forms, :response_id
  end
end
