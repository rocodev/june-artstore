class CreateSalesTickets < ActiveRecord::Migration
  def change
    create_table :sales_tickets do |t|
      t.integer :quantity
      t.integer :buyer_id
      t.integer :payment_type

      t.timestamps
    end
  end
end
