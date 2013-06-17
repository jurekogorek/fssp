class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [:autocomplete_user_name]
  autocomplete :user, :name, :full=>true,:extra_data => [:id,:title], :display_value => :full_name
  # GET /users
  # GET /users.json
  def index
    redirect_to :action=>:show,:id=>params[:id] and return if params[:id]
    @users = User.order("SUBSTRING_INDEX(SUBSTRING_INDEX( `name` , ' ', 2 ),' ',-1)   ")#.paginate(:page=>params[:page] , :per_page=>50)
    @tabelka=true
    respond_to do |format|
      format.html # index.html.erb
#      format.json { render json: @users }
    end
  end



  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
#      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
#      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    check_admin_or_dziekan
    respond_to do |format|
      if @user.save
        @user.roles<<Role.find(params[:functions]) unless params[:functions].nil?
        format.html { redirect_to(users_url, notice: 'User was successfully created.') }
#        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
#        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    check_admin_or_dziekan
    respond_to do |format|
      if @user.update_attributes(params[:user])
        @user.roles.clear
        @user.roles<<Role.find(params[:functions]) unless params[:functions].nil?
        format.html { redirect_to(users_url, notice: 'User was successfully updated.') }
#        format.json { head :ok }
      else
        format.html { render action: "edit" }
#        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    check_admin_or_dziekan
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
#      format.json { head :ok }
    end

  end
end
