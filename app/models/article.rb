class Article < ActiveRecord::Base
  belongs_to :menu_item
  attr_accessible :short, :title, :tresc,:menu_item_id,:image_id
  has_many :pictures,:dependent=>:destroy
  before_save :add_nofollow
  
  belongs_to :image

  def menu_name
    if menu_item
      menu_item.title
    else
      ""
    end
  end

  def image_full_title
    if image
      image.title
    else
      ""
    end
  end

  def menu_name_full
    if menu_item
      "#{menu_item.typ} | #{menu_item.title}"
    else
      ""
    end
  end


  def tresc_prep
    t=tresc
    return t unless t
    t.gsub!(/\[img\](.*)\[\/img\]/) do |s|
      "<img class='tutor' src=\"http://#{$1}\" />"
    end
    t.gsub!(/\[ln\](.*)\[\/ln\]/) do |s|
      "<a  href=\"http://#{$1}\" rel=\"nofollow\" target=\"blank\">#{$1} </a>"
    end

    t.gsub!(/\[yt\](.*)\[\/yt\]/) do |s|
      if ($1 =~/^(https?:\/\/)?(www\.)?youtube.com\/watch\?v=([a-z0-9-]+)/i)
       a=3
       "</span><iframe width=\"425\" height=\"349\" src=\"http://www.youtube.com/embed/#{$3}\" frameborder=\"0\" allowfullscreen></iframe><span class='line'>"
      end
    end


    t
  end

  private

  def add_nofollow
    doc = Nokogiri::HTML.parse(self.tresc)
    links = []
    doc.css('a').each do |link|     
     link.set_attribute('rel','noindex nofollow')
    end
    self.tresc = doc.to_s
  end

end
