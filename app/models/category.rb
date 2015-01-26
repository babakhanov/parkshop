class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy
  
  def flt
    # Rename this method
    # Collect all products (ids) and compare request to find all unique filter_values or better filter_names order by product's subitems
    products = Product.select(:id).where(:category_id => self.id).pluck(:id)
    SubProduct.joins(:filter_values).where(:sub_product.id => products)
  end

end
