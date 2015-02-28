class OrdersController < ApplicationController
  def new
    @order_items = get_cart_info  
    order = Order.new 
    get_cart_info.each do |item|
      line_item = order.order_items.new 
      line_item.price = item.price
      line_item.sub_product = item 
      line_item.quantity = item.amount
      line_item.save
    end
    @current_order = order
    #order.save
  end


  def edit
    @shipping_methods = ShippingMethod.all 
    @payment_methods = PaymentMethod.all
    @order = Order.find params[:id]
    if params["shipping_method"].present? && params["payment_method"].present?
      render action: :confirm
    else
      render action: :edit
    end
  end

end
