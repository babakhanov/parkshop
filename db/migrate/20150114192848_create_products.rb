class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :title
      t.text :small_text
      t.text :description

      t.timestamps null: false
    end
  end
end
