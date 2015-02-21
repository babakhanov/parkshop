class OrderItemsController < ApplicationController
  def new
    if params[:product].present? && params[:item].present?

      node = Product.find params[:product]
      sub = SubProduct.find params[:item]

      sub_id = sub.id.to_s
      cart_line = ""

      cart_items = get_cart_items

      if cart_items[sub_id].present?
        cart_items[sub_id] += 1
        cart_line << cart_str(sub_id, cart_items[sub_id])
      else
        cart_line << cart_str(sub_id, 1)
      end
      
      cart_items.each do |key, val|
        cart_line << cart_str(key, val) if key != sub_id
      end

      cookies.permanent[:cart_info] = cart_line
      redirect_to node
    else
      redirect_to :root
    end
  end

end
