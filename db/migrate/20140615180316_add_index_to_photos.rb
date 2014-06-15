class AddIndexToPhotos < ActiveRecord::Migration
  def change
  	add_index :photos, :product_id
  end
end
