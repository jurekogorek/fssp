class AddTypMenu < ActiveRecord::Migration
  def change
    add_column :menu_items, :typ, :string
  end
end
