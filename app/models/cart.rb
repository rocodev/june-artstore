class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  has_many :items, :through => :cart_items, :source => :product

  def add_product_to_cart(product)
    current_item = cart_items.find {|item| item.product == product}
    if current_item
      current_item.increment_quantity
    else
      cart_item = cart_items.build
      cart_item.product_id = product
      cart_item.save
    end
  end

  def total_price
    cart_items.inject(0) {|sum, item| sum+item.product.price*item.quantity}
  end

  def empty_cart(cart)
    CartItem.where(["cart_id =?", cart.id]).delete_all
  end

  def delete_product_from_cart(product_id)
    CartItem.where(["product_id=? AND cart_id=?", product_id, self.id]).delete_all
  end

end
