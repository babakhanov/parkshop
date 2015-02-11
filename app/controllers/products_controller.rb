class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @sub_products = @product.sub_items
    @category = @product.category
  end
end
