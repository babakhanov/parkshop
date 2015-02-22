class CreateUploadedFiles < ActiveRecord::Migration
  def change
    create_table :uploaded_files do |t|
      t.string :title
      t.string :file
      t.string :description

      t.timestamps null: false
    end
  end
end
