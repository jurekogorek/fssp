class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :title
      t.references :parent

      t.timestamps
    end
    add_index :menu_items, :parent_id
  end
end
