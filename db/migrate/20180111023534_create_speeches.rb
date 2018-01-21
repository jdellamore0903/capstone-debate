class CreateSpeeches < ActiveRecord::Migration[5.1]
  def change
    create_table :speeches do |t|
      t.boolean :affirmative?
      t.integer :user_id
      t.string :speech_title
      t.integer :debate_id

      t.timestamps
    end
  end
end
