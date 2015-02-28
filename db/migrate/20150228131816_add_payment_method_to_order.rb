class AddPaymentMethodToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :payment_method, index: true
    add_foreign_key :orders, :payment_methods
  end
end
