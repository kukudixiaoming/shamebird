class CategoriesController < ApplicationController

  http_basic_authenticate_with name: "lulu", password: "secret", except: [:index, :show]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
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
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:category_name, :category_brief, :category_image)
  end
end
