class AddCountToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :count, :integer, :default => 1
  end
end
