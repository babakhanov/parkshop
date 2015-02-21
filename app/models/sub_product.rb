class SubProduct < ActiveRecord::Base
  attr_accessor :amount
  belongs_to :product
  has_and_belongs_to_many :filter_values

end
