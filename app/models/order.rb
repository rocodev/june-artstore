class Order < ActiveRecord::Base
  belongs_to :user

  has_one  :info,  class_name: "OrderInfo", dependent: :destroy
  has_many :items, class_name: "OrderItem", dependent: :destroy

  accepts_nested_attributes_for :info

  before_create :generate_token

  def build_item_cache_from_cart(cart)
    cart.items.each do |cart_item|
      order_item = items.build
      order_item.product_name = cart_item.title
      order_item.quantity = 1
      order_item.price = cart_item.price
      order_item.save
    end
  end

  def calculate_total!(current_cart)
    self.total = current_cart.total_price
    self.save
  end

  def generate_token
    self.token = SecureRandom.uuid
  end
end
