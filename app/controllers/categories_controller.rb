class CategoriesController < ApplicationController
  def all
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

end
