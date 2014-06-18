class AddCartItemTotalToCarItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :cart_item_total, :float
  end
end
