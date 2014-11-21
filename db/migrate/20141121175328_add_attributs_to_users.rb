class AddAttributsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :contact, :string
    add_column :users, :address, :text
    add_column :users, :points, :integer, default: 0
  end
end
