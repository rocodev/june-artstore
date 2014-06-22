class AddQuantityToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :quantity, :integer, default: 1, after: :product_id
  end
end
