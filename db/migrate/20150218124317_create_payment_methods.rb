class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.text :title

      t.timestamps null: false
    end
  end
end
