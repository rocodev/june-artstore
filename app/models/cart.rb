class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items,
                   source: :product
  # products INNER JOIN cart_items ON products.id = cart_items.product_id
  # WHERE cart_items.cart_id = x

  def add_product_to_cart(product)
    items << product
  end

  def total_price
    items.sum(:price)
    # SELECT SUM(`products`.`price`) AS sum_id FROM `products`
    # INNER JOIN `cart_items` ON `products`.`id` = `cart_items`.`product_id`
    # WHERE `cart_items`.`cart_id` = x
  end
  # items.inject(0) { |sum, item| sum + item.price }
  # items.map(&:price).inject(:+)

  # 清空購物車
  def clear!
    cart_items.delete_all
  end
end
