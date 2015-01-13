class CreateFilterValuesProducts < ActiveRecord::Migration
  def self.up
    create_table :filter_values_products, :id => false do |t|
      t.references :filter_value, :product
    end

    add_index :filter_values_products, [:filter_value_id, :product_id],
      name: "filter_values_products_index",
      unique: true
  end

  def self.down
    drop_table :filter_values_products
  end
end
