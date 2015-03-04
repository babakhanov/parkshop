class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :shipping_method
  belongs_to :payment_method
  belongs_to :user
end
