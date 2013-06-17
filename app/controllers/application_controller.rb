class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice=>"Please log in"
      end
    end

    def check_admin_or_dziekan
      u = User.find_by_id(session[:user_id])
      unless u.has_role('dziekan') or u.has_role('admin')
        redirect_to users_url, :notice =>"You don't have permission"
      end
    end
    
  def wybierz_layout(typ)
    if typ.nil?
      "application"
    elsif typ == "sedilla"
      "sedilla"
    elsif typ == "ars"
      "ars"
    elsif typ == "eos"
      "eos"
    else
      "application"
    end
  end

end
