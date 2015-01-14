class CreateFilterNames < ActiveRecord::Migration
  def change
    create_table :filter_names do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
