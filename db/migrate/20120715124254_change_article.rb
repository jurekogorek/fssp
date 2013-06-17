class ChangeArticle < ActiveRecord::Migration
  def up
    change_column :articles,:short,:text
  end

  def down
  end
end
