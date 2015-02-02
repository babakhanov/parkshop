class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy
  
  def filter_groups

    filter_columns = {}

    filters = FilterValue
      .includes(:filter_name)
      .joins(sub_products: :product)
      .where('products.category_id' => self.id)
      .uniq

    filters.each do |filter|
      key = filter.filter_name.id
      key = key.to_s
      if defined? filter_columns[key][:name]
        filter_columns[key][:filter] << filter
      else
        filter_columns[key] = {:filter => [filter], :name => filter.filter_name.name}
      end
    end

    filter_columns.to_a

  end 

end
