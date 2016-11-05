class AlbumsController < ApplicationController

  # http_basic_authenticate_with name: Setting.User_Name, password: Setting.Password, except: [:index, :show]
  before_action :logged_in_user, except: [:index, :show]

  def new
    @category = Category.find(params[:category_id])
    @album = @category.albums.new
  end

  def create
    @category = Category.find(params[:category_id])
    @album = @category.albums.new(album_params)
    if @album.save then
      redirect_to category_url(@category)
    else
      render 'new'
    end
  end

  # def index
  #   @categories = Category.all
  #   @category = Category.find(params[:category_id])
  #   @albums = Album.paginate(page: params[:page], per_page: 12)
  # end

  def edit
    @category = Category.find(params[:category_id])
    @album = @category.albums.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @album = @category.albums.find(params[:id])
    if @album.update(album_params)
      redirect_to category_url(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @album = @category.albums.find(params[:id])
    @album.destroy
    redirect_to category_url(@category)
  end

  private
  def album_params
    params.require(:album).permit(:description, :picture)
  end

end
