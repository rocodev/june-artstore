class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  def increment_quantity(quantity)
    self.quantity = self.quantity + quantity
    self.save
  end
end

