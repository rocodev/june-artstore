class OrderInfo < ActiveRecord::Base
	belongs_to :order

	validate :billing_name, :presence => true
	validate :billing_address, :presence => true
	validate :shipping_name, :presence => true
	validate :shipping_address, :presence => true
end
