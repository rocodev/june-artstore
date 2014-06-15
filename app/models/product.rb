class Product < ActiveRecord::Base

  has_many :photos

  # accepts_nested_attributes_for :MODEL
  # 可以直接更新關聯 MODEL 的資料
  accepts_nested_attributes_for :photos

  # 驗證表單是否填妥
  validates_presence_of :title, :quantity

end
