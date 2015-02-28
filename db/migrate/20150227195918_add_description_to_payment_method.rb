class AddDescriptionToPaymentMethod < ActiveRecord::Migration
  def change
    add_column :payment_methods, :description, :string
  end
end
