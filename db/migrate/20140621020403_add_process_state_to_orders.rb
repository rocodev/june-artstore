class AddProcessStateToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :process_state, :string
  end
end
