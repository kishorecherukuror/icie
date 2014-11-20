class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.integer :points

      t.timestamps
    end
    add_attachment :news, :image_a
  end
end
