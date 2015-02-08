class CategoriesController < ApplicationController
  include CategoriesHelper

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category.filters = get_filters

    @price_points = @category.price_range

    params[:price_from].present? ? @price_points[2] = params[:price_from] : @price_points[2] = @price_points[0] 
    params[:price_to].present? ? @price_points[3] = params[:price_to] : @price_points[3] = @price_points[1]

    @price_points = @price_points.map(&:to_i)

    if @price_points[0] != @price_points[2] || @price_points[1] != @price_points[3]
      @category.price_from = @price_points[2]
      @category.price_to = @price_points[3]
    else
      @category.price_from = 0
      @category.price_to = 0
    end

    @filter_groups = @category.filter_groups
    @products = @category.items.page(params[:page]).per(12)

  end

end
