class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy

  attr_accessor :filters
    
  def filter_groups
    groups = []
    filter_groups = FilterValue.get_groups(self.id)

    filter_groups.each do |index, value|

      my_filter = FilterName.find(index)
      group_name = my_filter.name
      index = index.to_s

      value.each do |filter|
        if !@filters.present? || !@filters[index].present? || !@filters[index].include?(filter.id.to_s)
          filter.updated_at = nil
        end
      end

      groups << {:name => group_name, :group_id => index, :items => value }
    end

    groups
  end


  def items
    if @filters.length > 0 
      sub_products = []
      @filters.each do |filter|
        subs = SubProduct.joins(:filter_values).where('filter_values.id' => filter[1]).uniq.map(&:id)
        sub_products << subs
      end
      sub_products = sub_products.inject(:&)
      Product.joins(:sub_products).where('sub_products.id' => sub_products, :category_id => self.id).uniq
    else
      Product.where('category_id' => self.id)
    end
  end

  def price_range
    prices = SubProduct.joins(:product).where('products.category_id' => self.id).where('price > 0').order(price: :asc).map(&:price)
    prices = prices.map(&:to_s)
    [prices.first, prices.last]
  end
end
