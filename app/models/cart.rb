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
        items << product
# 這個method 讓我很頭痛,  
#看不太懂為什麼有 items 這個東西
#然後因為現在的功能是要能選擇"數量"放入購物車
#我完全不知道到底該用什麼方法才可以改變  cart_items 這個 table 裡面的 quantity欄位
  end


  def total_price
    items.inject(0) {|sum, item| sum + item.price }
  end
end
