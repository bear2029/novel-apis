class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.references :book, index: true, foreign_key: true
      t.string :title
      t.string :body
      t.integer :seq

      t.timestamps null: false
    end
    add_index :chapters, :seq
  end
end
