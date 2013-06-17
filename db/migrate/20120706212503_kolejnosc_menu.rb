class KolejnoscMenu < ActiveRecord::Migration
  def change
    add_column :menu_items, :kolejnosc, :integer
  end
end
