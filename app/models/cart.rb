class Cart < ActiveRecord::Base

  has_many :cart_items, :dependent => :destroy
  has_many :items, :through => :cart_items, :source => :product

  def add_product_to_cart(product)
    items << product
  end

  def total_price
    items.inject(0) { |sum, item| sum + (item.price * self.cart_items.find_by(:product_id => item.id).quantity) }
    #self.cart_items.inspect
  end

  def clear_cart_item
    items.delete_all
  end

end
