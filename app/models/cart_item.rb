class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  def increment_quantity
    self.quantity = self.quantity + 1
    self.save
  end
end

