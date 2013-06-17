class SessionsController < ApplicationController
  skip_before_filter :authorize, :only => [:create, :new, :destroy]
  def new
  end

  def create
#    if user = (User.kerb_authenticate(params[:login],params[:password]) || User.authenticate(params[:login],params[:password]))
    if user = User.authenticate(params[:login],params[:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      redirect_to login_url, :alert => "Invalid user/password combination!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_url, :notice => "Logged out"
  end

end
