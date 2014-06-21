class Order < ActiveRecord::Base
  
  belongs_to :user
  has_many :items, :class_name => "OrderItem", :dependent => :destroy
  has_one :info, :class_name => "OrderInfo", :dependent => :destroy
 
  accepts_nested_attributes_for :info
  
  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

 
  def build_item_cache_from_cart(cart)
    # item 有string :product_names
    cart.items.each do |cart_item|
      item = items.build
      item.product_name = cart_item.title
      #binding.pry   
      #id = Products.where(title: cart_item.title).take!
      item.quantity = CartItem.where("product_id =? AND cart_id=?", cart_item.id, cart.id).take!.count
      #item.quantity = 1
      item.price = cart_item.price
      item.save
    end 
  end

  def calculate_total!(current_cart)
    self.total = current_cart.total_price(current_cart.id)
    self.save
  end

  def set_payment_with!(method)
    self.update_column(:payment_method, method)
  end

  def pay!
    self.update_column(:paid, true)
  end

#AASM  => acts_as_state_machine
  include AASM

  aasm do
    state :order_placed, :initial => true
    state :paid, :after_commit => :pay!
    event :make_payment do 
      transitions :from => :order_placed, :to => :paid
    end

    state :shipping
    event :ship do 
      transitions :from => :paid, :to => :shipping
    end

    state :shipped
    event :deliver do 
      transitions :from => :shipping, :to => :shipped
    end

    state :order_cancelled
    event :cancell_order do 
      transitions :from => [:order_placed, :paid ], :to => :order_cancelled
    end

    state :good_returned
    event :return_good do 
      transitions :from => [:shipped ], :to => :good_returned
    end

  end

end
