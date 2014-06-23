class ChangeUserIsAdminSort < ActiveRecord::Migration
  def change
    change_column :users, :is_admin, :boolean, after: :email
  end
end
