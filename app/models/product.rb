class Product < ActiveRecord::Base
  has_many :sub_products, dependent: :destroy
  has_many :product_pics, dependent: :destroy
  
  belongs_to :category
  accepts_nested_attributes_for :sub_products, :allow_destroy => true

  def sub_items
    SubProduct.includes(filter_values: :filter_name).where(:product_id => self.id)
  end

end
