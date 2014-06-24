class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1}
  validate :check_product_quantity

  private
  def check_product_quantity

    if quantity == nil || product.quantity < quantity
      errors.add(:quantity, "You order too many")
    end
  end
end
