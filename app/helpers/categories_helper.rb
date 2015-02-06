module CategoriesHelper
  def get_filters
    if params[:filters]
      params[:filters]
    else
      []
    end
  end
end
