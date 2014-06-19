# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Cart < ActiveRecord::Base

  has_many :cart_items, :dependent => :destroy
  has_many :items, :through => :cart_items, :source => :product


  def add_product_to_cart(product)
    cart_item = cart_items.build
    cart_item.product = product
    cart_item.quantity = amount
    cart_item.save
  end

  def clear!
    cart_items.delete_all
  end

  def total_price
    items.inject(0) {|sum, item| sum + item.price}
  end

end
