class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :filter_names
end
