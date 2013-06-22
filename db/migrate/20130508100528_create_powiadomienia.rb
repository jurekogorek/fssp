class CreatePowiadomienia < ActiveRecord::Migration
  def change
    create_table :powiadomienia do |t|
      t.string :message
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
