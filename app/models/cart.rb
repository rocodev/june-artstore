class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destory
  has_many :items, :through => :cart_items, :source => :product

  def add_product_to_cart(product)
    items << product
  end
end
