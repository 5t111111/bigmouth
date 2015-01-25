class CreateBigmouthArticles < ActiveRecord::Migration
  def change
    create_table :bigmouth_articles do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
