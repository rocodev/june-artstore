# -*- encoding : utf-8 -*-
class AddIsAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, :default => false
  end
end
