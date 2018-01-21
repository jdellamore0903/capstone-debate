class CreateCitationComments < ActiveRecord::Migration[5.1]
  def change
    create_table :citation_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :citation_id
      t.boolean :positive

      t.timestamps
    end
  end
end
