class ArticlesController < ApplicationController
  skip_before_filter :authorize, :only => [:show,:autocomplete_menu_item_title]
  autocomplete :menu_item, :title,:full=>true,:extra_data => [:id,:typ],:display_value => :full_name
  autocomplete :image, :title,:full=>true,:extra_data => [:id],:display_value => :title
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.order("created_at DESC").paginate(:page=>params[:page],:per_page=>40)

    respond_to do |format|
      format.html # index.html.erb
#      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    session[:article_id]=@article.id
    respond_to do |format|
      format.html # show.html.erb
      if @article.menu_item
       render :layout=>"#{wybierz_layout(@article.menu_item.typ)}" and return
      else
       render :layout=>"application" and return
      end
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    @article.save!(:validate => false)
    session[:article_id]=@article.id
    @picture=Picture.new
    
    respond_to do |format|
      format.html # new.html.erb
#      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    @picture=Picture.new
     session[:article_id]=@article.id
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    check_admin_or_dziekan
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
#        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
    @picture=Picture.new
     session[:article_id]=@article.id
    check_admin_or_dziekan
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
#        format.json { head :no_content }
      else
        format.html { render action: "edit" }
#        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    check_admin_or_dziekan
    respond_to do |format|
      format.html { redirect_to articles_url }
#      format.json { head :no_content }
    end
  end
end
