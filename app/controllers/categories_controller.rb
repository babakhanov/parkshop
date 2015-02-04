class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])

    @filters = []

    if defined? params[:filters]
      @filters = params[:filters].to_a
    end
    
    @filter_groups = @category.filter_groups

    @products = @category.products(@filters)


  end

end
