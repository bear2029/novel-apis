class CreateCrawlers < ActiveRecord::Migration
  def change
    create_table :crawlers do |t|
      t.string :name
      t.string :test_list_url
      t.string :test_item_url
      t.string :list_url_pattern
      t.string :item_url_pattern

      t.timestamps null: false
    end
  end
end
