class AddUserIdToBigmouthImages < ActiveRecord::Migration
  def change
    add_column :bigmouth_images, :user_id, :integer
  end
end
