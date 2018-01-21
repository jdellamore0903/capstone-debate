class CreateCitations < ActiveRecord::Migration[5.1]
  def change
    create_table :citations do |t|
      t.string :author
      t.string :url_link
      t.integer :up_vote
      t.integer :down_vote

      t.timestamps
    end
  end
end
