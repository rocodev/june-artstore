class AddAvatarToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :avatar, :string
  end
end
