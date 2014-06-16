class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|

      t.timestamps
    end
  end
end
