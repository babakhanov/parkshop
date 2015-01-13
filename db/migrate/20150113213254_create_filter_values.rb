class CreateFilterValues < ActiveRecord::Migration
  def self.up
    create_table :filter_values do |t|
      t.string :value

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :filter_values
  end
end
