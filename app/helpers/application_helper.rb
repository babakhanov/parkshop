module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def get_cart_items
    items = {}
    if cookies[:cart_info]
      orders = cookies[:cart_info].split("&")
      orders.each do |item|
        buf = item.split("#")
        items[buf.first] = buf.last.to_i
      end
    end
    items
  end
  
  def cart_str(key, value)
    key.to_s + '#' + value.to_s + '&'
  end

  def get_cart_info
    cart_items = get_cart_items
    sub_products = cart_items.keys
    items = SubProduct.includes(:product).where(id: sub_products)
    items.each do |item|
      key = item.id.to_s
      item.amount = cart_items[key]
    end
    items
  end

  def cart_items_quant
    get_cart_items.values.inject(:+)
  end
  
  def cart_summ
    summ = 0
    get_cart_info.each do |item|
      summ = item.price * item.amount + summ
    end
    summ
  end

end
