class AddFirstMenuItem < ActiveRecord::Migration
  def up
    if MenuItem.all.empty?
      MenuItem.create(
        :title=>"home",
        :typ=>"fssp"
      )
    end
  end

  def down
  end
end
