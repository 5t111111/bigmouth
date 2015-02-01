class CreateBigmouthFiles < ActiveRecord::Migration
  def change
    create_table :bigmouth_files do |t|
      t.string :label

      t.timestamps null: false
    end
  end
end
