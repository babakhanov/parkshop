class CreateSubProducts < ActiveRecord::Migration
  def change
    create_table :sub_products do |t|
      t.string :name
      t.decimal :price
      t.references :product, index: true

      t.timestamps null: false
    end
  end
end
