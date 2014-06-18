class ChangeDefaultQuantityOfCartItem < ActiveRecord::Migration
  def change
    change_column :cart_items, :quantity, :integer, :default=>1
  end
end
