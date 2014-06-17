class Cart < ActiveRecord::Base

  has_many :cart_items, :dependent => :destroy
  # 透過 cart_items 和 items 作關聯，根據 cart_items 中的 product
  has_many :items, :through => :cart_items, :source => :product

  def add_product_to_cart(product)
    # ？
    items << product
  end

  def total_price
    items.inject(0) {|sum, item| sum + item.price }
  end

  # 清空購物車
  def clear!
    # delete_all 是內建的 method
    # 查一下和 destroy_all 的差別
    cart_items.delete_all
  end

end
