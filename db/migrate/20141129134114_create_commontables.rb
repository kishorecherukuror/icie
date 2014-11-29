class CreateCommontables < ActiveRecord::Migration
  def change
    create_table :commontables do |t|
      t.string :heading
      t.text :content
	  t.integer :points, default: 0  
	  t.references :parent_table, polymorphic: true
	   
	  t.timestamps
    end
    add_attachment :commontables, :image, :string
  end
end
