class AddUploadedByToBigmouthFiles < ActiveRecord::Migration
  def change
    add_column :bigmouth_files, :uploaded_by, :integer
  end
end
