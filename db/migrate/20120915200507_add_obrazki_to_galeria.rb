class AddObrazkiToGaleria < ActiveRecord::Migration
  def change
    add_column :pictures, :article_id,:integer
  end
end
