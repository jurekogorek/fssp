class AddAdminUser < ActiveRecord::Migration
  def up
   execute "insert into roles (id,name) values (1,'admin')"
    execute "insert into roles (id,name) values (2,'dziekan')"
     execute "insert into roles (id,name) values (3,'zwykly')"
    execute "insert into users (id,login,name,hashed_password,salt) values (5,'iczepiel','iczepiel','a07a7d2070462c7d88aeb2b06e3acc8d6ca4d852f689ffd6a7cd9ca6042d62f9','698433842470000.155180601868654')"
    execute "insert into users_roles(user_id,role_id) values (5,1)"
  end

  def down
  end
end
