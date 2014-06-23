class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items,
                   source: :product
  # products INNER JOIN cart_items ON products.id = cart_items.product_id
  # WHERE cart_items.cart_id = x

  def add_product_to_cart(product)
    items << product
    # cart_item          = cart_items.build
    # cart_item.product  = product
    # cart_item.quantity = amount
    # cart_item.save
  end

  def total_price
    cart_items.inject(0) { |sum, item| sum + (item.product.price * item.quantity) }
  end
  # cart_items.map { |item| item.product.price * item.quantity }.sum
  # cart_items.to_enum.sum { |item| item.product.price * item.quantity }

  # items.sum(:price)
  # SELECT SUM(`products`.`price`) AS sum_id FROM `products`
  # INNER JOIN `cart_items` ON `products`.`id` = `cart_items`.`product_id`
  # WHERE `cart_items`.`cart_id` = x

  # items.inject(0) { |sum, item| sum + item.price }
  # items.map(&:price).inject(:+)

  # 清空購物車
  def clear!
    cart_items.delete_all
  end
end
