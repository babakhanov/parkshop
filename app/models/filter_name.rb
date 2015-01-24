class FilterName < ActiveRecord::Base
  has_many :filter_values
  belongs_to :category
end
