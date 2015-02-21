class ShippingMethod < ActiveRecord::Base
  has_and_belongs_to_many :payment_methods
end
