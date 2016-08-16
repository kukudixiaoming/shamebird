class AlbumsController < ApplicationController

  http_basic_authenticate_with name:"lulu", password:"secret", except: [:index, :show]

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path
    else
      render 'new'
    end
  end

  def index
    @categories = Category.all
    @albums = Album.paginate(page: params[:page], per_page: 12)
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to albums_path
    else
      render 'edit'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

private
  def album_params
    params.require(:album).permit(:description, :picture)
  end

end
