class AddCartQuantityToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :cart_quantity, :integer, :default => 1
  end
end
