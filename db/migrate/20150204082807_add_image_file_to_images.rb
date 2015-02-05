class AddImageFileToImages < ActiveRecord::Migration
  def change
    add_column :bigmouth_images, :image_file_id, :string
    add_column :bigmouth_images, :image_file_size, :string
    add_column :bigmouth_images, :image_file_filename, :string
    add_column :bigmouth_images, :image_file_content_type, :string
  end
end
