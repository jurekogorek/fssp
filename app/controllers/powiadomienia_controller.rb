class PowiadomieniaController < ApplicationController
  skip_before_filter :authorize, :only => [:show,:hide]
  # GET /powiadomienia
  # GET /powiadomienia.json
  def index
    @powiadomienia = Powiadomienie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @powiadomienia }
    end
  end

  # GET /powiadomienia/1
  # GET /powiadomienia/1.json
  def show
    @powiadomienie = Powiadomienie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @powiadomienie }
    end
  end

  # GET /powiadomienia/new
  # GET /powiadomienia/new.json
  def new
    @powiadomienie = Powiadomienie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @powiadomienie }
    end
  end

  # GET /powiadomienia/1/edit
  def edit
    @powiadomienie = Powiadomienie.find(params[:id])
  end

  # POST /powiadomienia
  # POST /powiadomienia.json
  def create
    @powiadomienie = Powiadomienie.new(params[:powiadomienie])

    respond_to do |format|
      if @powiadomienie.save
        format.html { redirect_to @powiadomienie, notice: 'Powiadomienie was successfully created.' }
        format.json { render json: @powiadomienie, status: :created, location: @powiadomienie }
      else
        format.html { render action: "new" }
        format.json { render json: @powiadomienie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /powiadomienia/1
  # PUT /powiadomienia/1.json
  def update
    @powiadomienie = Powiadomienie.find(params[:id])

    respond_to do |format|
      if @powiadomienie.update_attributes(params[:powiadomienie])
        format.html { redirect_to @powiadomienie, notice: 'Powiadomienie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @powiadomienie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /powiadomienia/1
  # DELETE /powiadomienia/1.json
  def destroy
    @powiadomienie = Powiadomienie.find(params[:id])
    @powiadomienie.destroy

    respond_to do |format|
      format.html { redirect_to powiadomienia_url }
      format.json { head :no_content }
    end
  end
  
  def hide
    ids = [params[:id], *cookies.signed[:hidden_announcement_ids]]
    cookies.permanent.signed[:hidden_announcement_ids] = ids
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
