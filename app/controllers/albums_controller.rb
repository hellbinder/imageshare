class AlbumsController < ApplicationController
  before_filter :authenticate_user!, :only => [:show]
  #authorize is user is owner or if its being shared to them
  def authorized?
    @album.in?(current_user.owned_albums) || @album.in?(current_user.albums)
  end

  def can_edit?
    @album.user_id == current_user.id
  end

  # GET /albums
  # GET /albums.json
  def index 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])
		@images = @album.images
      if authorized?
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @album }
        end
      else
        redirect_to(albums_path,:notice => "You do not have access to the album")
      end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
      @album = Album.find(params[:id])
    if !can_edit?
      redirect_to(albums_path,:notice => "You cannot edit the album")
    end
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(params[:album])
    @album.user_id = current_user.id
    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = Album.find(params[:id])
    user_albums = 
    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end
end
