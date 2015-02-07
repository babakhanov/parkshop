class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy
  
  def filter_groups(filter_params)
    filters = []
    filter_groups = FilterValue
                      .joins(sub_products: :product)
                      .where(products: {category_id: self.id})
                      .order(filter_name_id: :asc)
                      .uniq
                      .group_by(&:filter_name_id)

    filter_groups.each do |index, value|
      filter_name = FilterName.find(index).name
      index = index.to_s
      value.each do |filter|
        if !filter_params.present? || !filter_params[index].present? || !filter_params[index].include?(filter.id.to_s)
          filter.updated_at = nil
        end
      end
      filters << {:name => filter_name, :group_id => index, :items => value }
    end

    filters
  end

  def items(filters)
    if filters.length > 0 
      sub_products = []
      filters.each do |filter|
        subs = SubProduct.joins(:filter_values).where('filter_values.id' => filter[1]).uniq.map(&:id)
        sub_products << subs
      end
      sub_products = sub_products.inject(:&)
      Product.joins(:sub_products).where('sub_products.id' => sub_products, :category_id => self.id).uniq
    else
      Product.where('category_id' => self.id)
    end
  end

end
