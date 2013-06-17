class AddImportnantArticles < ActiveRecord::Migration
  def up
    Article.create(
      :title=>"fssp.pl",
      :tresc=>"<b>aaa</b>"
    )
     Article.create(
      :title=>"sedilla.pl",
      :tresc=>"<b>aaa</b>"
    )
  end

  def down
  end
end
