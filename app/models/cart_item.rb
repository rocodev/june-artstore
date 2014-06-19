# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: cart_items
#
#  id              :integer          not null, primary key
#  cart_id         :integer
#  product_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#  cart_quantity   :integer          default(1)
#  cart_item_total :float
#  cart_item_price :float
#

class CartItem < ActiveRecord::Base

  belongs_to :cart
  belongs_to :product

end
