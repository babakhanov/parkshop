class FilterValue < ActiveRecord::Base
  has_and_belongs_to_many :sub_products
  belongs_to :filter_name
  attr_accessor :checked

  def self.get_groups(category_id)
    FilterValue.joins(sub_products: :product)
      .where(products: {category_id: category_id})
      .order(filter_name_id: :asc, title: :asc).uniq
      .group_by(&:filter_name_id)
  end

end
