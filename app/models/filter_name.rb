class FilterName < ActiveRecord::Base
  has_many :filter_values, dependent: :destroy
end
