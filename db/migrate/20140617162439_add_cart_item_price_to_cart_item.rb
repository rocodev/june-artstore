class AddCartItemPriceToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :cart_item_price, :float
  end
end
