class UniqueAuthorNameAndBookName < ActiveRecord::Migration
  def change
    add_index :authors, :name, :unique => true
    add_index :books, :name, :unique => true
  end
end
