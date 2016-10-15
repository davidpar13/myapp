class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.belongs_to :author, index: true
      t.string :title
      t.text :description
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
