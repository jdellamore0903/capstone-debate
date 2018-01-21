class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.text :tag
      t.text :card_text
      t.string :argument_type
      t.integer :user_id
      t.integer :citation_id
      t.integer :debate_id
      t.integer :topic_id
      t.integer :speech_id

      t.timestamps
    end
  end
end
