class CreateResponseTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :response_types do |t|
      t.boolean :response?
      t.integer :user_id
      t.integer :speech_id

      t.timestamps
    end
  end
end
