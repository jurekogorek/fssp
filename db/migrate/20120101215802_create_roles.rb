class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
    end
    create_table :users_roles,:id=>false do |t|
      t.integer :role_id
      t.integer :user_id
    end

  end
end
