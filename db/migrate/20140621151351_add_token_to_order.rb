class AddTokenToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :token, :string, after: :user_id
    add_index  :orders, :token
  end
end
