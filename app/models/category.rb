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

      value.each do |filter|
        if !filter_params.include?(filter.id.to_s)
          filter.updated_at = nil
        end
      end
      filters << {:name => filter_name, :items => value }
    end

    filters
  end

  def items(filters)
    if filters.length > 0 
      subs = SubProduct
              .joins(:filter_values)
              .where('filter_values.id' => filters)
              .group('1,2')
              .having("COUNT(filter_values.id) =#{filters.length}")
              .uniq
              .map(&:product_id)
      Product.where(:id => subs, :category_id => self.id).uniq
    else
      Product.where('category_id' => self.id)
    end
  end

end
