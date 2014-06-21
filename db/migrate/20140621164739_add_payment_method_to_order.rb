class AddPaymentMethodToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :payment_method, :string, after: :paid
  end
end
