class AddCategoryRefsToFilterName < ActiveRecord::Migration
  def self.up
    change_table :filter_names do |t|
      t.references :category, index: true
    end
  end
  def self.down
    change_table :filter_names do |t|
      t.remove :category_id
    end
  end
end
