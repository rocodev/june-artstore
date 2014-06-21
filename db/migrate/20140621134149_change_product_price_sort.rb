class ChangeProductPriceSort < ActiveRecord::Migration
  def change
    change_column :products, :price, :float, after: :description
  end
end
