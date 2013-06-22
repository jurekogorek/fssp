class AddMoreToPowiadomienia < ActiveRecord::Migration
  def change
    add_column :powiadomienia, :more_confirm, :string
    add_column :powiadomienia, :more, :text
    change_column :powiadomienia, :message, :text
  end
end
