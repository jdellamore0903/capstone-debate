class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :topic_title
      t.integer :prior_aff_votes
      t.integer :prior_neg_votes

      t.timestamps
    end
  end
end
