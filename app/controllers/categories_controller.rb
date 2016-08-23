class CategoriesController < ApplicationController

  http_basic_authenticate_with name: "lulu", password: "secret", except: [:index, :show]

  def category_which_url(category)
    case @category.category_type
    when "post"
    redirect_to category_posts_url(category)
    when "microblog"
    redirect_to category_microblogs_url(category)
    when "album"
    redirect_to category_albums_url(category)
  else
    ##跳出处理
  end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      category_which_url(@category)
    else
      render 'new'
    end
  end

  def show
    params[:id] = "1" if params[:id] == nil #bug
    @category = Category.find(params[:id])
    @categories = Category.all #例外，只是为了show视图的最上面
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      category_which_url(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url
  end

  private
  def category_params
    params.require(:category).permit(:category_name, :category_brief, :category_image, :category_type)
  end
end
