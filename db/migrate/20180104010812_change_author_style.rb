class ChangeAuthorStyle < ActiveRecord::Migration[5.1]
  def change
    add_column :citations, :author_first, :string
    add_column :citations, :author_last, :string
    remove_column :citations, :author
  end
end
