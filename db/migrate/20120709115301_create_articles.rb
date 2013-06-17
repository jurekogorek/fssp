class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :short
      t.string :title
      t.text :tresc
      t.references :menu_item

      t.timestamps
    end
    add_index :articles, :menu_item_id
  end
end
