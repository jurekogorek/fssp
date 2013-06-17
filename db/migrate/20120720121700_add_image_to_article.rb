class AddImageToArticle < ActiveRecord::Migration
  def change
    add_column :articles,:image_id,:int
  end
end
