class Order < ActiveRecord::Base

  belongs_to :user
  has_many :items, :class_name => "OrderItem", :dependent => :destroy
  has_one :info, :class_name => "OrderInfo", :dependent => :destroy

  accepts_nested_attributes_for :info

  include Tokenable

  def build_item_cache_from_cart(cart)
    cart.items.each do |cart_item|
      # https://github.com/rails/rails/blob/959fb8ea651fa6638aaa7caced20d921ca2ea5c1/activerecord/lib/active_record/relation.rb#L84
      # build method is a alias of 'new'
      item = items.build
      item.product_name = cart_item.title
      item.quantity = 1
      item.price = cart_item.price
      item.save
    end
  end

  def caculate_total!(current_cart)
    self.total = current_cart.total_price
    self.save
  end

  def set_payment_with!(method)
    self.update_column(:payment_method, method)
  end

  def pay!
    self.update_column(:paid, true)
  end

  include AASM

  aasm do
    # 預設為 order placed
    # 結賬後狀態轉為 paid
    state :order_placed, :initial => true
    # If you want to make sure a depending action happens only after the transaction is committed, use the after_commit callback
    # 確認狀態變更後 => pay! (update column paid to t)
    state :paid, :after_commit => :pay!
    event :make_payment do
      transitions :from => :order_placed, :to => :paid
    end

    # 出貨後狀態轉為 shipping
    state :shipping
    event :ship do
      transitions :from => :paid, :to => :shipping
    end

    # 到貨後狀態轉為 shipped
    state :shipped
    event :deliver do
      transitions :from => :shipping, :to => :shipped
    end

    state :order_cancelled
    event :cancel_order do
      transitions :from => [:order_placed, :paid], :to => :order_cancelled
    end

    state :good_returned
    event :return_good do
      transitions :from => :shipped, :to => :good_returned
    end
  end

end
