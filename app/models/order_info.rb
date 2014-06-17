class OrderInfo < ActiveRecord::Base
  belongs_to :order

  validates_presence_of :billing_name, :billing_address, :shipping_name, :shipping_address
end
