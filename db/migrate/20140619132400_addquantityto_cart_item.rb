class AddquantitytoCartItem < ActiveRecord::Migration
  def change
  	add_column :Cart_Items, :quantity, :integer
  end
end
