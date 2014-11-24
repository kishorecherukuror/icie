class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :division, :string
    add_column :users, :category, :string
  end
end
