class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :info
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
