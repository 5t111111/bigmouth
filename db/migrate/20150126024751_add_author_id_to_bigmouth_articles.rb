class AddAuthorIdToBigmouthArticles < ActiveRecord::Migration
  def change
    add_column :bigmouth_articles, :author_id, :integer
  end
end
