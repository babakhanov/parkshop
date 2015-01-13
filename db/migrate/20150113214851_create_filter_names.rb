class CreateFilterNames < ActiveRecord::Migration
  def self.up
    create_table :filter_names do |t|
      t.string :title

      t.timestamps null: false
    end
  end
  def self.down
    drop_table :filter_names
  end
end
