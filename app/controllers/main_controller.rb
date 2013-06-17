class MainController < ApplicationController
    skip_before_filter :authorize, :only => [:index]
  def index
    @menu_item = MenuItem.where("id=#{MenuItem.pierwsza("fssp")}").first
    render :template=>"menu_items/show"
  end
end
