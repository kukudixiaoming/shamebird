class MicroblogsController < ApplicationController

  http_basic_authenticate_with name: "lulu", password: "secret", except: [:index, :show]

  def new
    @category = Category.find(params[:category_id])
    @microblog = @category.microblogs.new
  end

  def create
    @category = Category.find(params[:category_id])
    @microblog = @category.microblogs.new(microblog_params)
    if @microblog.save
      redirect_to category_microblogs_path
    else
      render 'new'
    end
  end

  def show
    @microblog = Microblog.find(params[:id])
  end

  def index
    @category = Category.find(params[:category_id])
    @microblogs = @category.microblogs
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:category_id])
    @microblog = Microblog.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @microblog = @category.microblogs.find(params[:id])
    if @microblog.update(microblog_params)
      redirect_to category_microblogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @microblog = @category.microblogs.find(params[:id])
    @microblog.destroy
    redirect_to category_microblogs_path
  end

  private
  def microblog_params
    params.require(:microblog).permit(:text, :photo, :music)
  end

end
