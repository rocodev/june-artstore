class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  has_many :items, :through => :cart_items, :source => :product

  def add_product_to_cart(product,quantity)
    current_item = cart_items.find {|item| item.product == product}
    if current_item.present?
      current_item.increment_quantity(quantity.to_i)
    else
      cart_item = cart_items.build
      cart_item.product_id = product.id
      cart_item.quantity = quantity.to_i
      cart_item.save
    end
  end

  def total_price
    cart_items.inject(0) {|sum, item| sum+item.product.price*item.quantity}
  end

  def empty_cart
    cart_items.delete_all
  end

end
