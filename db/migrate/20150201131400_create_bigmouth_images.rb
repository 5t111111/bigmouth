class CreateBigmouthImages < ActiveRecord::Migration
  def change
    create_table :bigmouth_images do |t|
      t.string :label

      t.timestamps null: false
    end
  end
end
