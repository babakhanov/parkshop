class CategoriesController < ApplicationController
  include CategoriesHelper

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category.filters = get_filters

    @price_points = @category.price_range

    @filter_groups = @category.filter_groups
    @products = @category.items.page(params[:page]).per(12)
  end

end
