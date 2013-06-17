class MenuItem < ActiveRecord::Base
  belongs_to :parent,:class_name=>"MenuItem",:foreign_key=>"parent_id"
  has_many :childs,:class_name=>"MenuItem",:foreign_key=>"parent_id",:order=>"kolejnosc ASC"
  attr_accessible :title,:parent_id,:kolejnosc,:typ

  has_many :articles,:order=>"created_at DESC"

  def parent_name
    if parent
      parent.title
    else
      ""
    end
  end

  def full_name
    "#{typ} | #{title}"
  end

  def self.pierwsza(typ)
    MenuItem.where(["(parent_id is NULL or parent_id=0) and typ=?",typ]).order("kolejnosc ASC").limit(1).first.id
  end

  def self.glowne(typ)
    MenuItem.where(["(parent_id is NULL or parent_id=0) and typ=?",typ]).order("kolejnosc ASC")
  end


  def articles_for_list(page,per_page)
    self.articles.paginate(:page=>page,:per_page=>per_page)
  end
end
