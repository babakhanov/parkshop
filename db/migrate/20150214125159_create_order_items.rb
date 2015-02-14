class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.decimal :price
      t.references :sub_product, index: true
      t.references :order, index: true
      t.timestamps null: false
    end
  end
end
