class CategoriesController < ApplicationController
  def all
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @filters = []

    if defined? params[:filters]
      @filters = params[:filters].to_a
    end
  end

end
