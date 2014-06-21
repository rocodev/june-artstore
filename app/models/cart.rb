class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items,
                   source: :product
  # products INNER JOIN cart_items ON products.id = cart_items.product_id
  # WHERE cart_items.cart_id = x

  def add_product_to_cart(product)
    items << product
  end
end
