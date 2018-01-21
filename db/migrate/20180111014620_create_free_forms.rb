class CreateFreeForms < ActiveRecord::Migration[5.1]
  def change
    create_table :free_forms do |t|
      t.text :ff_text
      t.string :user

      t.timestamps
    end
  end
end
