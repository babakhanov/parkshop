class AddFilterNameRefsToChild < ActiveRecord::Migration
  def self.up
    change_table :filter_values do |t|
      t.references :filter_name, index: true
    end
  end
  def self.down
    change_table :filter_values do |t|
      t.remove :filter_name_id
    end
  end
end
