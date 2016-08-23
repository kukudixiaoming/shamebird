class AlbumsController < ApplicationController

  http_basic_authenticate_with name: "lulu", password: "secret", except: [:index, :show]

  def new
    @category = Category.find(params[:category_id])
    @album = @category.albums.new
  end

  def create
    @category = Category.find(params[:category_id])
    @album = @category.albums.new(album_params)
    if @album.save then
      redirect_to category_albums_url
    else
      render 'new'
    end
  end

  def index
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @albums = Album.paginate(page: params[:page], per_page: 12)
  end

  def edit
    @category = Category.find(params[:category_id])
    @album = @category.albums.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @album = @category.albums.find(params[:id])
    if @album.update(album_params)
      redirect_to category_albums_url
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @album = @category.albums.find(params[:id])
    @album.destroy
    redirect_to category_albums_url
  end

  private
  def album_params
    params.require(:album).permit(:description, :picture)
  end

end
