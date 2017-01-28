class MicroblogsController < ApplicationController

  # http_basic_authenticate_with name: Setting.User_Name, password: Setting.Password, except: [:index, :show]
  before_action :logged_in_user, except: [:index, :show]

  def new
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @microblog = @category.microblogs.new
  end

  def create
    @category = Category.find(params[:category_id])
    @microblog = @category.microblogs.new(microblog_params)
    if @microblog.save
      redirect_to category_url(@category)
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
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @microblog = Microblog.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @microblog = @category.microblogs.find(params[:id])
    if @microblog.update(microblog_params)
      redirect_to category_url(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @microblog = @category.microblogs.find(params[:id])
    @microblog.destroy
    redirect_to category_url(@category)
  end

  private
  def microblog_params
    params.require(:microblog).permit(:text, :photo, :music)
  end

end
