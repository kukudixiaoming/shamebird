class CommentsController < ApplicationController

  # http_basic_authenticate_with name: Setting.User_Name, password: Setting.Password, only: :destroy
  before_action :logged_in_user, only: :destroy

  def create
    @categories = Category.all #我也不知道为什么要有这个，但没有这个会有错误
    #undefined method `each' for nil:NilClass
    #categories/_header.html.erb   <% @categories.each do |category| %>

    #16.7.23更新 解决上面的注释
    #保存不成功时，create动作会render template: "posts/show"
    #而不是交给postscontroller的show动作渲染，所以要有这个语句
    #与其他控制器不同的地方是，渲染的模板不是本控制器的视图
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:post_id])
    # @comment = @post.comments.new(comment_params)
    # if @comment.save
    #   redirect_to category_post_path(@category, @post)
    # else
    #   render template: "posts/show"
    # end
    #其实上面的写法不是很机智，可以不用if else 判断，因为无论保存成功或失败，都是然后再渲染同一个页面，
    @comment = @post.comments.new(comment_params)
    if verify_rucaptcha?(@comment)&&@comment.save
      redirect_to category_post_path(@category, @post)
    else
      #render template: "posts/show"
      render html: "<strong>表单填写错误请重新填写</strong>".html_safe
    end
  end

  def index
    #@category = Category.find(params[:category_id])
    #@post = Post.find(params[:post_id])
    #@comments = Comment.all
    @categories = Category.all
    @comments = Comment.paginate(page: params[:page], per_page: Setting.Comments_Paginate)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:post_id])
    # @comment = Comment.find(params[:id]) #这个也行
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to category_post_path(@category, @post)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_author, :comment_email, :comment_site, :comment_text)
  end
end
