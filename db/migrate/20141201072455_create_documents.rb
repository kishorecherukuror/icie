class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :category

      t.timestamps
    end
  end
end
