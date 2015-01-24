class CreateFilterValuesSubProducts < ActiveRecord::Migration
  def change
    create_table :filter_values_sub_products, :id => false do |t|
      t.references :filter_value, :sub_product
    end

    add_index :filter_values_sub_products, [:filter_value_id, :sub_product_id],
      name: "filter_values_sub_products_index",
      unique: true
  end
end
