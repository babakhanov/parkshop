class AddShippingMethodToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :shipping_method, index: true
    add_foreign_key :orders, :shipping_methods
  end
end
