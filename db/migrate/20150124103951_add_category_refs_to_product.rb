class AddCategoryRefsToProduct < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.references :category, index: true
    end
  end
  def self.down
    change_table :products do |t|
      t.remove :category_id
    end
  end
end
