class CreateFilterValues < ActiveRecord::Migration
  def change
    create_table :filter_values do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
