class AddProductToProductPic < ActiveRecord::Migration
  def change
    add_reference :product_pics, :product, index: true
    add_foreign_key :product_pics, :products
  end
end
