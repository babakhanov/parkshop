class CreatePaymentMethodsShippingMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods_shipping_methods, :id => false do |t|
      t.references :payment_method, :shipping_method
    end

    add_index :payment_methods_shipping_methods, [:payment_method_id, :shipping_method_id],
      name: "payment_methods_shipping_methods_index",
      unique: true
  end
end
