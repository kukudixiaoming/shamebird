class CommentsController < ApplicationController

  def create
    @categories = Category.all #我也不知道为什么要有这个，但没有这个会有错误
                               #undefined method `each' for nil:NilClass
                               #categories/_header.html.erb   <% @categories.each do |category| %>
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:post_id])
    # @comment = @post.comments.new(comment_params)
    # if @comment.save
    #   redirect_to category_post_path(@category, @post)
    # else
    #   render template: "posts/show"
    # end
    @comment = @post.comments.create(comment_params)
    redirect_to category_post_path(@category, @post)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to category_post_path(@category, @post)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_author, :comment_email, :comment_site, :comment_text)
    end
end
