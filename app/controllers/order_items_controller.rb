class OrderItemsController < ApplicationController
  def new
    if params[:product].present?
      node = Product.find params[:product]
      redirect_to node
    else
      redirect_to :root
    end
  end
end
