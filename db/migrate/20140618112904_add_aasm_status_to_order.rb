class AddAasmStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :aasm_state, :string, :defaulf => "order_placed"
    add_index :orders, :aasm_state
  end
end
