class Admin::OrdersController < ApplicationController

  def index 
    @orders =  Order.all 

	end

  def show
    @order = Order.find(params[:id])
  	#@order = Order.find_by(params[:id])  使用這樣的查詢  結果只會傳回一筆 item 但實際上有5筆 why ?
  end

	def update
	  @order = Order.find(params[:id])
    #@order.params[:order => :aasm_state])
    
    # 想法： 想透過傳入前一頁頁面的 aasm_state 的值，然後觸發讓 @order 去執行 aasm 的 event 
    # ex: 如果前面選 ship , 這樣我就可以執行  @order.ship 這個 event 

    #flash[:notice] = "aaabbbb state :" + "#{params[:order => :aasm_state]}"
    #不知道為什麼無法抓出 parmas :order 這個 hash 裡面的 aasm_state 這個 hash 的值 傳不出來
    render :show
  end


end
