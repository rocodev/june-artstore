class RemoveImageNameFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :image_name, :string
  end
end
