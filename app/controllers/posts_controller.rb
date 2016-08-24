class PostsController < ApplicationController

  http_basic_authenticate_with name: "lulu", password: "secret", except: [:index, :show]

  def new
    @category = Category.find(params[:category_id])
    @post = @category.posts.new
  end

  # 这种方法在表单填写有错误时，不能 render 'new'
  # 而是直接 redirect_to category_path(@category)，这是为什么？？
  # 可能是 new 中为 @post = @category.posts.new，而下面的 create 没有这一步直接
  # @post = @category.posts.create(post_params)， @post 不能在 保存失败后，在两个动作之间传递
  # def create
  #   @category = Category.find(params[:category_id])
  #   if @post = @category.posts.create(post_params)
  #      redirect_to category_path(@category)
  #     # redirect_to category_post_path(@category, @post)
  #   else
  #     render 'new'
  #   end
  # end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.new(post_params)
    if @post.save
      redirect_to category_post_path(@category, @post)
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
    # @comments = @post.comments
    # @comment = @post.comments.new
    @categories = Category.all #例外，只是为了show视图的最上面
  end

  def index
    @categories = Category.all #例外，只是为了show视图的最上面
    @category = Category.find(params[:category_id])
    # @post = @category.posts.find(params[:id])
    # @posts = @category.posts
  end

  def edit
    @category = Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    # @post = Post.find(params[:id]) 这样写也不会出错
    @post = @category.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to category_post_path(@category, @post)
      # redirect_to category_post_path(@category, @post)
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    # @post = Post.find(params[:id]) 这样写也不会出错
    @post = @category.posts.find(params[:id])
    @post.destroy
    redirect_to category_path(@category)
  end

  private
  def post_params
    params.require(:post).permit(:post_title, :post_text, :post_image)
  end
end
