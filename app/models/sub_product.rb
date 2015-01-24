class SubProduct < ActiveRecord::Base
  belongs_to :product
  has_and_belongs_to_many :filter_values
end
