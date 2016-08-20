class MicroblogsController < ApplicationController

  http_basic_authenticate_with name: "lulu", password: "secret", except: [:index, :show]

  def new
    @microblog = Microblog.new
  end

  def create
    @microblog = Microblog.new(microblog_params)
    if @microblog.save
      redirect_to microblogs_path
    else
      render 'new'
    end
  end

  def show
    @microblog = Microblog.find(params[:id])
  end

  def index
    @microblogs = Microblog.all
    @categories = Category.all
  end

  def edit
    @microblog = Microblog.find(params[:id])
  end

  def update
    @microblog = Microblog.find(params[:id])
    if @microblog.update(microblog_params)
      redirect_to microblogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @microblog = Microblog.find(params[:id])
    @microblog.destroy
    redirect_to microblogs_path
  end

  private
  def microblog_params
    params.require(:microblog).permit(:text, :photo, :music)
  end

end
