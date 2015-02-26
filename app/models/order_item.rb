class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :sub_product
end
