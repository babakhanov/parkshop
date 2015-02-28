class AddDescriptionToShippingMethod < ActiveRecord::Migration
  def change
    add_column :shipping_methods, :description, :string
  end
end
