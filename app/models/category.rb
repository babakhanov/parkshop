class Category < ActiveRecord::Base
  has_many :products
  has_many :filter_names
end
