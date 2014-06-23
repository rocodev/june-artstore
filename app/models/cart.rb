class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  has_many :items, :through => :cart_items, :source => :product


  def total_price
    cart_items.inject(0) {|sum, item| sum + (item.product.price * item.quantity) }
  end

  def clear!
    cart_items.delete_all
  end
end
