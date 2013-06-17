class DeleteDziekan < ActiveRecord::Migration
  def up
    execute "delete from roles where id=2"
  end

  def down
  end
end
