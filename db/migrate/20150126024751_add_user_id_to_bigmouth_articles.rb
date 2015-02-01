class AddUserIdToBigmouthArticles < ActiveRecord::Migration
  def change
    add_column :bigmouth_articles, :user_id, :integer
  end
end
