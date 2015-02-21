class PaymentMethod < ActiveRecord::Base
  has_and_belongs_to_many :shipping_methods
end
