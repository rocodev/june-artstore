class Order < ActiveRecord::Base
  accepts_nested_attributes_for :info
end
