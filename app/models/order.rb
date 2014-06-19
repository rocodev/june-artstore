class Order < ActiveRecord::Base

  belongs_to :user
  has_many :items, :class_name => "OrderItem", :dependent => :destroy
  has_one :info, :class_name => "OrderInfo", :dependent => :destroy

  accepts_nested_attributes_for :info

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

  before_create :generate_token

  def generate_token
    # http://ruby-doc.org/stdlib-2.1.0/libdoc/securerandom/rdoc/SecureRandom.html
    self.token = SecureRandom.uuid
  end

  def set_payment_with!(method)
    self.update_column(:payment_method, method)
  end

  def pay!
    self.update_column(:paid, true)
  end

end
