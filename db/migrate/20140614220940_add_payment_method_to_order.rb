# -*- encoding : utf-8 -*-
class AddPaymentMethodToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :payment_method, :string
  end
end
