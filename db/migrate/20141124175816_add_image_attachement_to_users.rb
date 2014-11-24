class AddImageAttachementToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :image, :string
  	add_attachment :users, :image, :string
  end
end
