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
    @user = {first_name: "", last_name: "", phone: "", address: ""}
    if params["shipping_method"].present? && params["payment_method"].present?
      render action: :confirm
    else
      render action: :edit
    end
  end

  def update
    order_data = params["order"]
    order = Order.find params[:id]

    order.first_name = order_data["first_name"]
    order.last_name = order_data["last_name"] 
    order.phone = order_data["phone"] 
    order.address = order_data["address"] 
    order.comment = order_data["comment"]
    order.shipping_method = ShippingMethod.find order_data["shipping_method"]
    order.payment_method = PaymentMethod.find order_data["payment_method"]
    if order.save
      cookies[:cart_info].clear
      render action: :success
    end

  end

end
