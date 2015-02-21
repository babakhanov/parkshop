class OrdersController < ApplicationController
  def new
    @order_items = get_cart_info  
  end
end
