class AddConfirmToPowiadomienia < ActiveRecord::Migration
  def change
    add_column :powiadomienia, :confirm, :string
  end
end
