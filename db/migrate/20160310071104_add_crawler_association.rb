class AddCrawlerAssociation < ActiveRecord::Migration
  def change
    add_column :books, :crawler_id, :integer
    add_foreign_key :books, :crawlers
  end
end
