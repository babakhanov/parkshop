class UploadedFileToProducts < ActiveRecord::Migration
  def self.up
    change_table :uploaded_files do |t|
      t.references :product, index: true
    end
  end
  def self.down
    change_table :uploaded_files do |t|
      t.remove :product_id
    end
  end
end
