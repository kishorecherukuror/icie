class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.boolean :approved, default: false  
      t.integer :user_type
      t.integer :user_id

      t.timestamps
    end
  end
end
