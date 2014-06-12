class AddProductImgToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_img, :string
  end
end
