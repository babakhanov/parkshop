class CreateShippingMethods < ActiveRecord::Migration
  def change
    create_table :shipping_methods do |t|
      t.text :title

      t.timestamps null: false
    end
  end
end
