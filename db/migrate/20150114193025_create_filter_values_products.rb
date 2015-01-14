class CreateFilterValuesProducts < ActiveRecord::Migration
  def change
    create_table :filter_values_products, :id => false do |t|
      t.references :filter_value, :product
    end

    add_index :filter_values_products, [:filter_value_id, :product_id],
      name: "filter_values_products_index",
      unique: true
  end
end
