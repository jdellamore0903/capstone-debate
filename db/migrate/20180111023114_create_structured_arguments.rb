class CreateStructuredArguments < ActiveRecord::Migration[5.1]
  def change
    create_table :structured_arguments do |t|
      t.boolean :advantage?
      t.string :argument_name
      t.integer :user_id
      t.integer :speech_id

      t.timestamps
    end
  end
end
