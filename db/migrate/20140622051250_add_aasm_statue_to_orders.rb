class AddAasmStatueToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :aasm_state, :string, default: "order_placed", after: :payment_method
    add_index  :orders, :aasm_state
  end
end
