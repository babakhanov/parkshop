class OrdersController < ApplicationController
  def new
    @order_items = get_cart_info  
  end
  def edit
    order = Order.new 
    get_cart_info.each do |item|
      line_item = order.order_items.new 
      line_item.price = item.price
      line_item.sub_product = item 
      line_item.quantity = item.amount
      line_item.save
    end
    order.save
    @msg = "hello"
  end
end
