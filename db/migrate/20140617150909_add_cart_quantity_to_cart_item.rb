# -*- encoding : utf-8 -*-
class AddCartQuantityToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :quantity, :integer, :default => 1
  end
end
