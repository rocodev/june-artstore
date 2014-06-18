class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  has_many :items, :through => :cart_items, :source => :product

  def add_product_to_cart(product)
    items << product
  end

  def total_price
    items.inject(0) {|sum, item| sum+item.price}
  end

  def empty_cart(cart)
    CartItem.where(["cart_id =?", cart.id]).delete_all
  end

  def delete_product_from_cart(product_id)
    CartItem.where(["product_id=? AND cart_id=?", product_id, self.id]).delete_all
  end

end
