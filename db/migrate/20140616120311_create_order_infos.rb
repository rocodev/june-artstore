class CreateOrderInfos < ActiveRecord::Migration
  def change
    create_table :order_infos do |t|

      t.timestamps
    end
  end
end
