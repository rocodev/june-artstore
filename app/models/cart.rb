class Cart < ActiveRecord::Base

  has_many :cart_items, :dependent => :destroy
  # 透過 cart_items 和 items 作關聯，根據 cart_items 中的 product
  has_many :items, :through => :cart_items, :source => :product

  def add_product_to_cart(product, qt)
    item = cart_items.new
    item.product = product
    item.quantity = qt
    item.save
  end

  def add_onemore_product_to_cart(product, qt)
    # 再加一個商品到購物車
    current_item = cart_items.find_by_product_id(product)
    current_item.quantity += qt
    current_item.save
  end

  def total_price
    cart_items.inject(0) {|sum, item| sum + item.product.price * item.quantity }
  end

  # 清空購物車
  def clear
    # delete_all 是內建的 method，可一次清空
    # destroy_all 會一個一個 row 刪（？）
    cart_items.delete_all
  end

end
