class CategoriesController < ApplicationController
  include CategoriesHelper

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @filter_groups = @category.filter_groups(get_filters)
    @products = @category.items(get_filters).page(params[:page]).per(12)
  end

end
