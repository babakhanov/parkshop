class Product < ActiveRecord::Base
  has_many :sub_products, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :sub_products, :allow_destroy => true
end
