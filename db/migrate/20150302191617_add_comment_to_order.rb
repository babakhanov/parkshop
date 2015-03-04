class AddCommentToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :comment, :string
    add_column :orders, :address, :string
    add_column :orders, :phone, :string
  end
end
