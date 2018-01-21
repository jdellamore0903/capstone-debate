class AddArticleTitleAndAtrributes < ActiveRecord::Migration[5.1]
  def change
    add_column :citations, :article_title, :string
    add_column :citations, :article_date, :string
  end
end
