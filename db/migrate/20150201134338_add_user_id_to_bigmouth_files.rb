class AddUserIdToBigmouthFiles < ActiveRecord::Migration
  def change
    add_column :bigmouth_files, :user_id, :integer
  end
end
