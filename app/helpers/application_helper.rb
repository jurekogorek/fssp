module ApplicationHelper
    def has_role(r)
    if current_user
    current_user.roles.where(:name=>r).first
    else
      false
    end
  end

  def admin_or_dziekan
    if current_user
      current_user.roles.where(:name=>'admin').first or current_user.roles.where(:name=>'dziekan').first
    else
      false
    end
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

end
