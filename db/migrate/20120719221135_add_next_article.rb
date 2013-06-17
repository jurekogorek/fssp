class AddNextArticle < ActiveRecord::Migration
  def up
      Article.create(
      :title=>"ars.fssp.pl",
      :tresc=>"<b>aaa</b>"
    )
     Article.create(
      :title=>"constitueseos.pl",
      :tresc=>"<b>aaa</b>"
    )

    MenuItem.create(
        :title=>"home1",
        :typ=>"ars"
      )
      MenuItem.create(
        :title=>"home2",
        :typ=>"eos"
      )
  end

  def down
  end
end
