class Product < ActiveRecord::Base
  has_many :sub_products
  belongs_to :category
end
