class CreateDebates < ActiveRecord::Migration[5.1]
  def change
    create_table :debates do |t|
      t.integer :aff_user_id
      t.integer :neg_user_id
      t.integer :affirmative_votes
      t.integer :negative_votes
      t.integer :topic_id

      t.timestamps
    end
  end
end
