class Image < ActiveRecord::Base
  attr_accessible :title,:avatar
  has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "150x150>" }

  has_one :article
end
